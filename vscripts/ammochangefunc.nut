::mp_gamemode <- Convars.GetStr("mp_gamemode").tolower();


if (!("MANACAT" in getroottable())){
	::MANACAT <-{
	}
}

if(!("weaponChanger" in ::MANACAT)){
	::MANACAT.weaponChanger <- {
		check = false
	}
}

::ammoChangeVar <- {
	ammoList = {} //삭제하는 탄약더미
	ammoIndex = -1
	dropList = {} //삭제한 탄약더미 자리에 놓은 무기
	dropIndex = -1
	nerfList = {} //2->1티어
	nerfIndex = -1

	firstround = true //대전인 경우, 1라운드 체크. true가 1라운드

	sessionData = {}
}

::AmmoChangeFunc<-{
	function skinSelect(wclassname){
		switch(wclassname){
			case "weapon_smg_spawn":			case "models/w_models/weapons/w_smg_uzi.mdl":
			case "weapon_pumpshotgun_spawn":	case "models/w_models/weapons/w_shotgun.mdl":
			case "Weapon_smg_silenced_spawn":	case "models/w_models/weapons/w_smg_a.mdl":
			case "weapon_shotgun_chrome_spawn":	case "models/w_models/weapons/w_pumpshotgun_A.mdl":
			case "weapon_hunting_rifle_spawn":	case "models/w_models/weapons/w_sniper_mini14.mdl":
				return RandomInt(0,1);
			case "weapn_pistol_magnum_spawn":	case "models/w_models/weapons/w_desert_eagle.mdl":
			case "weapn_rifle_spawn":			case "models/w_models/weapons/w_rifle_m16a2.mdl":
			case "weapn_rifle_ak47_spawn":		case "models/w_models/weapons/w_rifle_ak47.mdl":
				return RandomInt(0,2);
			default:	return 0;
		}
	}
	function OnGameEvent_round_start_post_nav(params){
		RestoreTable("amospawn", ::ammoChangeVar.sessionData);
		if(::ammoChangeVar.sessionData.len() != 0){
		//	printl("플레이 맵 "+::ammoChangeVar.sessionData["mapname"]);
		}else{
			::ammoChangeVar.sessionData["mapname"] <- "-";
		}
		if(::mp_gamemode == "versus"){
			if(::ammoChangeVar.sessionData["mapname"] == Director.GetMapName()){
				::ammoChangeVar.firstround <- false;
			}
		}

		if(::mp_gamemode != "versus" && ::saveloadammo()){
			//인근 생존자 확인
			local survs = {};
			local ent = null;
			local survi = 0;
			while (ent = Entities.FindByClassname(ent, "player")){
				if(ent.IsValid())if(ent.IsSurvivor()){
					survs[survi++] <- ent;
				}
			}

			local weapon = null;
			while (weapon = Entities.FindByClassname(weapon, "weapo*pawn")){
				if(weapon.IsValid()){
					local classname = weapon.GetClassname();
					if(classname == "weapon_molotov_spawn" || classname == "weapon_pipe_bomb_spawn" || classname == "weapon_vomitjar_spawn"
					|| classname == "weapon_upgradepack_incendiary_spawn" || classname == "weapon_upgradepack_explosive_spawn"
					|| classname == "weapon_pain_pills_spawn" || classname == "weapon_adrenaline_spawn" || classname == "weapon_first_aid_kit_spawn" || classname == "weapon_defibrillator_spawn")continue;
					local pos = weapon.GetOrigin();
					local near = false;
					for(local i = 0; i < survi; i++){
						if((pos - survs[i].GetOrigin()).Length() < 1050){
							near = true;
							break;
						}
					}
					if(near)continue;
					
					local skinV = ::AmmoChangeFunc.skinSelect(weapon.GetModelName());
					weapon.__KeyValueFromString("skin", skinV.tostring());
					weapon.__KeyValueFromString("weaponskin", skinV.tostring());
				}
			}
		}
	}

	function OnGameEvent_player_left_safe_area(params){
		::AmmoChangeFunc.ammoChanger();
	}

	function OnGameEvent_round_end(params){
		::ammoChangeVar.sessionData["mapname"] <- Director.GetMapName();
		SaveTable("amospawn", ::ammoChangeVar.sessionData);
	}

	function ammoChanger(){
		::AmmoChangeFunc.AmmoChangeProcess();
	}

	function AmmoChangeProcess(){
		local chkFinale = 0;
		local ent = null;
		while (ent = Entities.FindByClassname(ent, "trigger_finale"))
		{
			if(ent.IsValid())chkFinale = 1;
		}
		local wSpawnNo = 0;
		if(chkFinale == 0){
			if(!::saveloadammo()){
				//탄약더미 (비우기)
				while (ent = Entities.FindByClassname(ent, "weapon_ammo_spawn")){
					if(ent.IsValid()){
						local pos = ent.GetOrigin();
						local tgent = null; local near = false;
						while (tgent = Entities.FindByClassname(tgent, "player")){
							if(tgent.IsValid())if(tgent.IsSurvivor()){
								local dist = (tgent.GetOrigin() - pos).Length();
								if(dist < 1050){
									near = true;
									break;
								}
							}
						}
						if(near == true)continue;
						for(local i = 0; i < ::ammoChangeVar.ammoList.len(); i++){
							if((pos - ::ammoChangeVar.ammoList[i]).Length() < 2){
								ent.Kill();
								local ang = ent.GetAngles();

								local physicsblock = SpawnEntityFromTable("env_physics_blocker",
								{
									targetname = "ammo_physics"
									mins = Vector( -13, -13, -3 )
									boxmins = Vector( -13, -13, -3 )
									maxs = Vector( 13, 13, -0.5 )
									boxmaxs = Vector( 13, 13, -0.5 )
									initialstate = "1"
									BlockType = "4"
									origin = pos
									angles = Vector(ang.x,ang.y,ang.z)
								});
							}
						}
					}
				}

				//탄약더미 대체 1차무기 (생성)
				local weapon = 0;
				local wclassname = "weapon_spawn";

				for(local i = 0; i < ::ammoChangeVar.dropList.len(); i+=5){
					if(::ammoChangeVar.dropList[i+3] == "models/w_models/weapons/w_smg_uzi.mdl"){
						wclassname = "weapon_smg_spawn";
					}else if(::ammoChangeVar.dropList[i+3] == "models/w_models/weapons/w_smg_a.mdl"){
						wclassname = "Weapon_smg_silenced_spawn";
					}else if(::ammoChangeVar.dropList[i+3] == "models/w_models/weapons/w_smg_mp5.mdl"){
						wclassname = "weapon_smg_mp5_spawn";
					}else if(::ammoChangeVar.dropList[i+3] == "models/w_models/weapons/w_shotgun.mdl"){
						wclassname = "weapon_pumpshotgun_spawn";
					}else if(::ammoChangeVar.dropList[i+3] == "models/w_models/weapons/w_pumpshotgun_A.mdl"){
						wclassname = "weapon_shotgun_chrome_spawn";
					}

					local tname = "tier1_"+wSpawnNo;
					local pos = ::ammoChangeVar.dropList[i];
					pos.z += 8+(8*(::ammoChangeVar.dropList[i+4]-1)); // ::ammoChangeVar.dropList[i+4] -> x2변수

					wSpawnNo++;
					local t1w = SpawnEntityFromTable(wclassname,
					{
						targetname = tname
						model = weapon
						skin = ::ammoChangeVar.dropList[i+2]
						weaponskin = ::ammoChangeVar.dropList[i+2]
						origin = pos
						angles = ::ammoChangeVar.dropList[i+1]
						count = "1"
						solid = "6"
						spawnflags ="1"
					});
				}

				//2차무기 너프 (비우기)
				while (ent = Entities.FindByClassname(ent, "weapon*_spawn")){
					if(ent.IsValid()){
						local weapon = ent.GetModelName();
						local pos = ent.GetOrigin();

						local tgent = null; local near = false;
						while (tgent = Entities.FindByClassname(tgent, "player")){
							if(tgent.IsValid())if(tgent.IsSurvivor()){
								local dist = (tgent.GetOrigin() - pos).Length();
								if(dist < 1050){
									near = true;
									break;
								}
							}
						}
						if(near == true)continue;

						local ang = ent.GetAngles();
						local wclassname = "weapon_spawn";
						for(local i = 0; i < ::ammoChangeVar.nerfList.len(); i+=5){
							if((pos - ::ammoChangeVar.nerfList[i]).Length() < 3){
								//if(weapon == ::ammoChangeVar.nerfList[i+3]){
									ent.Kill();
								//}
							}
						}
					}
				}

				//2차무기 너프 (생성)
				for(local i = 0; i < ::ammoChangeVar.nerfList.len(); i+=5){
					local tname = "nerf_"+wSpawnNo;

					local pos = ::ammoChangeVar.nerfList[i];

					if(::ammoChangeVar.nerfList[i+4] == "models/w_models/weapons/w_smg_uzi.mdl"){
						wclassname = "weapon_smg_spawn";
					}else if(::ammoChangeVar.nerfList[i+4] == "models/w_models/weapons/w_smg_a.mdl"){
						wclassname = "Weapon_smg_silenced_spawn";
					}else if(::ammoChangeVar.nerfList[i+4] == "models/w_models/weapons/w_shotgun.mdl"){
						wclassname = "weapon_pumpshotgun_spawn";
					}else if(::ammoChangeVar.nerfList[i+4] == "models/w_models/weapons/w_pumpshotgun_A.mdl"){
						wclassname = "weapon_shotgun_chrome_spawn";
					}else if(::ammoChangeVar.nerfList[i+4] == "models/w_models/weapons/w_sniper_scout.mdl"){
						wclassname = "weapon_sniper_scout_spawn";
					}else if(::ammoChangeVar.nerfList[i+4] == "models/w_models/weapons/w_desert_rifle.mdl"){
						wclassname = "weapon_rifle_desert_spawn";
					}else if(::ammoChangeVar.nerfList[i+4] == "models/w_models/weapons/w_rifle_sg552.mdl"){
						wclassname = "weapon_rifle_sg552_spawn";
					}

					wSpawnNo++;
					local t1w = SpawnEntityFromTable(wclassname,
					{
						targetname = tname
						model = ::ammoChangeVar.nerfList[i+4]
						skin = ::ammoChangeVar.nerfList[i+3]
						weaponskin = ::ammoChangeVar.nerfList[i+3]
						origin = pos
						angles = ::ammoChangeVar.nerfList[i+1]
						count = "5"
						solid = "6"
						spawnflags ="0"
					});
				}
			}else{
				//인근 생존자 확인
				local survs = {};
				local ent = null;
				local survi = 0;
				while (ent = Entities.FindByClassname(ent, "player")){
					if(ent.IsValid())if(ent.IsSurvivor()){
						survs[survi++] <- ent;
					}
				}

				while (ent = Entities.FindByClassname(ent, "weapon_ammo_spawn")){
					if(ent.IsValid()){
						local pos = ent.GetOrigin();
						local near = false;
						for(local i = 0; i < survi; i++){
							if((pos - survs[i].GetOrigin()).Length() < 1050){
								near = true;
								break;
							}
						}
						if(near == true)continue;
						if(RandomInt(1,5)!=1){
							local ang = ent.GetAngles();

							local physicsblock = SpawnEntityFromTable("env_physics_blocker",
							{
								targetname = "ammo_physics"
								mins = Vector( -13, -13, -3 )
								boxmins = Vector( -13, -13, -3 )
								maxs = Vector( 13, 13, -0.5 )
								boxmaxs = Vector( 13, 13, -0.5 )
								initialstate = "1"
								BlockType = "4"
								origin = pos
								angles = Vector(ang.x,ang.y,ang.z)
							});

							::ammoChangeVar.ammoList[++::ammoChangeVar.ammoIndex] <- pos.x+" "+pos.y+" "+pos.z;

							local x2 = RandomInt(1,7);
							if(x2 >= 6){
								x2 = 2;
							}else{
								x2 = 1;
							}
							local spawnedNo = -1;
							for(local i = 0; i < x2; i++){
								local weapon = RandomInt(0,4);
								local wclassname = "weapon_spawn";
								if(weapon == spawnedNo){
									weapon = (weapon+2);
									if(weapon >= 4)weapon-=4;
								}
								spawnedNo = weapon;
			
								local posback = 0;
								if(weapon == 0){
									wclassname = "weapon_smg_spawn";
									weapon = "models/w_models/weapons/w_smg_uzi.mdl";
									posback = -2;
								}else if(weapon == 1){
									wclassname = "Weapon_smg_silenced_spawn";
									weapon = "models/w_models/weapons/w_smg_a.mdl";
									posback = -4;
								}else if(weapon == 2){
									wclassname = "Weapon_smg_mp5_spawn";
									weapon = "models/w_models/weapons/w_smg_mp5.mdl";
									posback = -5;
								}else if(weapon == 3){
									wclassname = "weapon_pumpshotgun_spawn";
									weapon = "models/w_models/weapons/w_shotgun.mdl";
									posback = -10;
								}else if(weapon == 4){
									wclassname = "weapon_shotgun_chrome_spawn";
									weapon = "models/w_models/weapons/w_pumpshotgun_A.mdl";
									posback = -10;
								}
							
								local tname = "tier1_"+wSpawnNo;
								pos = ent.GetOrigin();
								ang = ent.GetAngles();
								if(x2 == 2)pos = pos + ang.Left().Scale(-7+(14*i));
								ang.x = 0;
								ang.y = RandomInt(0,359);
								ang.z = 90+(RandomInt(0,1)*180);
								pos = pos + ang.Forward().Scale(posback);//총 위치를 탄약 중앙쪽으로 옮기도록 조정

								local skinV = ::AmmoChangeFunc.skinSelect(wclassname);
								::ammoChangeVar.dropList[++::ammoChangeVar.dropIndex] <- pos.x+" "+pos.y+" "+pos.z+" "+ang.x+" "+ang.y+" "+ang.z+" "+skinV+" "+weapon+" "+(x2-i);
								pos.z += 8+(8*((x2-i)-1));

								local angvec = Vector(ang.x,ang.y,ang.z);
								wSpawnNo++;
								local t1w = SpawnEntityFromTable(wclassname,
								{
									targetname = tname
									model = weapon
									skin = skinV
									weaponskin = skinV
									origin = pos
									angles = angvec
									count = "1"
									solid = "6"
									spawnflags ="1"
								});
							}
							ent.Kill();
						}
					}
				}
		
				while (ent = Entities.FindByClassname(ent, "weapon*_spawn")){
					if(ent.IsValid()){
						//ent.Kill();		continue; //테스트
						local pos = ent.GetOrigin();
						local near = false;
						for(local i = 0; i < survi; i++){
							if((pos - survs[i].GetOrigin()).Length() < 1050){
								near = true;
								break;
							}
						}
						if(near == true)continue;
						if(RandomInt(1,3)==1){
							local weapon = ent.GetModelName();
							local ang = ent.GetAngles();
							local wclassname = "weapon_spawn";
							//printl("총기이름 " + ent.GetName() + " 총기모델 "+ent.GetModelName());
							if(weapon == "models/w_models/weapons/w_autoshot_m4super.mdl" ||
							weapon == "models/w_models/weapons/w_shotgun_spas.mdl"){
								weapon = RandomInt(0,1);
								if(weapon == 0){
									wclassname = "weapon_pumpshotgun_spawn";
									weapon = "models/w_models/weapons/w_shotgun.mdl";
								}else if(weapon == 1){
									wclassname = "weapon_shotgun_chrome_spawn";
									weapon = "models/w_models/weapons/w_pumpshotgun_A.mdl";
								}
							}else if(weapon == "models/w_models/weapons/w_sniper_mini14.mdl" ||
							weapon == "models/w_models/weapons/w_sniper_military.mdl" ||
							weapon == "models/w_models/weapons/w_sniper_awp.mdl"){
								weapon = RandomInt(0,2);
								if(weapon == 0){
									wclassname = "Weapon_sniper_scout_spawn";
									weapon = "models/w_models/weapons/w_sniper_scout.mdl";
								}else if(weapon == 1){
									wclassname = "weapon_rifle_desert_spawn";
									weapon = "models/w_models/weapons/w_desert_rifle.mdl";
								}else if(weapon == 2){
									wclassname = "weapon_rifle_sg552_spawn";
									weapon = "models/w_models/weapons/w_rifle_sg552.mdl";
								}
							}else if(weapon == "models/w_models/weapons/w_rifle_m16a2.mdl" ||
							weapon == "models/w_models/weapons/w_rifle_ak47.mdl" ||
							weapon == "models/w_models/weapons/w_desert_rifle.mdl" ||
							weapon == "models/w_models/weapons/w_rifle_sg552.mdl"){
								weapon = RandomInt(0,1);
								if(weapon == 0){
									wclassname = "weapon_smg_spawn";
									weapon = "models/w_models/weapons/w_smg_uzi.mdl";
								}else if(weapon == 1){
									wclassname = "Weapon_smg_silenced_spawn";
									weapon = "models/w_models/weapons/w_smg_a.mdl";
								}
							}

							if(wclassname != "weapon_spawn"){
								local tname = "nerf_"+wSpawnNo;
								local skinV = ::AmmoChangeFunc.skinSelect(wclassname);
								wSpawnNo++;
								local t1w = SpawnEntityFromTable(wclassname,
								{
									targetname = tname
									model = weapon
									skin = skinV
									weaponskin = skinV
									origin = pos
									angles = Vector(ang.x, ang.y, ang.z)
									count = "5"
									solid = "6"
									spawnflags ="0"
								});
								::ammoChangeVar.nerfList[++::ammoChangeVar.nerfIndex] <- pos.x+" "+pos.y+" "+pos.z+" "+ang.x+" "+ang.y+" "+ang.z+" "+ent.GetModelName()+" "+skinV+" "+weapon;
								ent.Kill();
							}
						}
					}
				}
			}
			::saveloadammo();
		}
	}
}

::saveloadammo <- function(){
	local mapName = Director.GetMapName();
	local saveload = null;

	switch(mapName){ //장대비는 대전모드와 관계없이 저장해야함
		case "c4m1_milltown_a": case "c4m2_sugarmill_a": saveload = "save"; break;
		case "c4m3_sugarmill_b": case "c4m4_milltown_b": case "c4m5_milltown_escape": saveload = "load"; break;
	}

	if(::mp_gamemode == "versus"){
		if(::ammoChangeVar.sessionData["mapname"] == mapName){
			saveload = "load";
		}else{
			saveload = "save";
			if(mapName == "c4m3_sugarmill_b" || mapName == "c4m4_milltown_b" || mapName == "c4m5_milltown_escape")saveload = "load";
		}
	}else{
		if(mapName == "c4m3_sugarmill_b")mapName = "c4m2_sugarmill_a";
		else if(mapName == "c4m4_milltown_b" || mapName == "c4m5_milltown_escape")mapName = "c4m1_milltown_a";
	}

	if(saveload == "save"){
		local ammolist = "";
		for(local i = 0; i < ::ammoChangeVar.ammoList.len(); i++)ammolist += ::ammoChangeVar.ammoList[i]+" ";
		local droplist = "";
		for(local i = 0; i < ::ammoChangeVar.dropList.len(); i++)droplist += ::ammoChangeVar.dropList[i]+" ";
		local nerflist = "";
		for(local i = 0; i < ::ammoChangeVar.nerfList.len(); i++)nerflist += ::ammoChangeVar.nerfList[i]+" ";

		StringToFile("ammo/"+mapName+"_ammolist.txt", ammolist);
		StringToFile("ammo/"+mapName+"_droplist.txt", droplist);
		StringToFile("ammo/"+mapName+"_nerflist.txt", nerflist);
	}else if(saveload == "load"){
		local ammolist = FileToString("ammo/"+mapName+"_ammolist.txt");
		ammolist = split(ammolist, " ");
		local droplist = FileToString("ammo/"+mapName+"_droplist.txt");
		droplist = split(droplist, " ");
		local nerflist = FileToString("ammo/"+mapName+"_nerflist.txt");
		nerflist = split(nerflist, " ");

		::ammoChangeVar.ammoList = {};
		::ammoChangeVar.ammoIndex = -1;
		for(local i = 0; i < ammolist.len(); i+=3){
			::ammoChangeVar.ammoList[++::ammoChangeVar.ammoIndex] <- Vector( ammolist[i].tointeger(), ammolist[i+1].tointeger(), ammolist[i+2].tointeger() );
		}
		::ammoChangeVar.dropList = {};
		::ammoChangeVar.dropIndex = -1;
		for(local i = 0; i < droplist.len(); i+=9){
			::ammoChangeVar.dropList[++::ammoChangeVar.dropIndex] <- Vector( droplist[i].tointeger(), droplist[i+1].tointeger(), droplist[i+2].tointeger() );
			::ammoChangeVar.dropList[++::ammoChangeVar.dropIndex] <- Vector( droplist[i+3].tointeger(), droplist[i+4].tointeger(), droplist[i+5].tointeger() );
			::ammoChangeVar.dropList[++::ammoChangeVar.dropIndex] <- droplist[i+6].tointeger();//스킨
			::ammoChangeVar.dropList[++::ammoChangeVar.dropIndex] <- droplist[i+7].tostring();
			::ammoChangeVar.dropList[++::ammoChangeVar.dropIndex] <- droplist[i+8].tointeger();
		}
		::ammoChangeVar.nerfList = {};
		::ammoChangeVar.nerfIndex = -1;
		for(local i = 0; i < nerflist.len(); i+=9){
			::ammoChangeVar.nerfList[++::ammoChangeVar.nerfIndex] <- Vector( nerflist[i].tointeger(), nerflist[i+1].tointeger(), nerflist[i+2].tointeger() );
			::ammoChangeVar.nerfList[++::ammoChangeVar.nerfIndex] <- Vector( nerflist[i+3].tointeger(), nerflist[i+4].tointeger(), nerflist[i+5].tointeger() );
			::ammoChangeVar.nerfList[++::ammoChangeVar.nerfIndex] <- nerflist[i+6].tostring(); //원래 무기
			::ammoChangeVar.nerfList[++::ammoChangeVar.nerfIndex] <- nerflist[i+7].tointeger();//스킨
			::ammoChangeVar.nerfList[++::ammoChangeVar.nerfIndex] <- nerflist[i+8].tostring(); //너프되는 무기
		}
		return false;
	}
	return true;
}

__CollectEventCallbacks(::AmmoChangeFunc, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);