::mp_gamemode <- Convars.GetStr("mp_gamemode").tolower();


Convars.SetValue("sv_consistency", 0);
Convars.SetValue("sv_pure_kick_clients", 0);

if (!("MANACAT" in getroottable())){
	::MANACAT <-{
	}
}

if(!("carController" in ::MANACAT)){
	::MANACAT.carController <- {
		check = false
	}
}
IncludeScript("manacat_carAlarm/manacatTimer");
if (!("manacatTimers" in getroottable())){
	IncludeScript("manacat/manacatTimer");
}

IncludeScript("manacat_carAlarm/caralarmTalker");
if (!("CaralarmVocalVars" in getroottable())){
	IncludeScript("manacat/caralarmTalker");
}

::entitygroups_car <- "entitygroups/";
IncludeScript("entitygroups_carAlarm/__car");
if ("EG_car" in getroottable()){
	::entitygroups_car <- "entitygroups_carAlarm/";
}else{
	::entitygroups_car <- "entitygroups/";
}

IncludeScript("manacat_carAlarm/colorSet");
if (!("colorSet" in getroottable())){
	IncludeScript("manacat/colorSet");
}
IncludeScript("manacat_carAlarm/alarmSound");
if (!("caralarmRNG" in getroottable())){
	IncludeScript("manacat/alarmSound");
}

::carChangeVar <- {
	controlList = {}
	controlIndex = -1

	sessionData = {}
}

::callCarChanger <- function(params){
	if("objectSpawner" in ::MANACAT)if(::MANACAT.objectSpawner.check == false){
		::manacatAddTimer(0.1, false, ::callcarChanger, { });
		return;
	}
	::carChanger();
}

::carChanger <- function(){
	/*if(Director.GetCommonInfectedCount() == 0){//필드 잡좀이 0마리면 준비가 안 된 것
		printl("<Car Controller> Spawn delayed.");
		::manacatAddTimer(0.1, false, ::callCarChanger, { });
		return;
	}*/
	if(::MANACAT.carController.check == true)return;
	local ent = null;

	function CarChanger(){
		printl("<Car Controller> Execute car control.");
		local mapName = Director.GetMapName();
		if(mapName.find("_") != null)mapName = mapName.slice(0, mapName.find("_")).tostring();

		local probability = 3;
		while (ent = Entities.FindByClassname(ent, "trigger_finale"))
		{
			if(ent.IsValid())probability = 5;
		}
		local wSpawnNo = 0;

		local alarmArray = {};
		local alarmArrayIndex = -1;

		//세이브가 있을 경우 로드(장대비)(대전)
		if(::saveloadcar() == false){
			while (ent = Entities.FindByClassname(ent, "prop_car_alarm"))
			{
				if(ent.IsValid())
				{
					if(ent.GetModelName() == "models/props_vehicles/cara_95sedan.mdl"){
						local pos = ent.GetOrigin();
						for(local i = 0; i < ::carChangeVar.controlList.len(); i+=4){
							::carChangeVar.controlList[i] = ::carChangeVar.controlList[i].tointeger();
							::carChangeVar.controlList[i+1] = ::carChangeVar.controlList[i+1].tointeger();
							::carChangeVar.controlList[i+2] = ::carChangeVar.controlList[i+2].tointeger();
							
							local tgOri = Vector(::carChangeVar.controlList[i], ::carChangeVar.controlList[i+1], ::carChangeVar.controlList[i+2]);
							if((pos - tgOri).Length() < 10){
								if(::carChangeVar.controlList[i+3] == "normalcar"){
									//이하 거의 동일//
									//수정한다면 아래를 수정해서 위로 복붙할 것
									//차 바꿔줄 때 ::carChangeVar.controlList 에 넣어주는 부분은 제거하고 옮길 것
									local pos = ent.GetOrigin();
									local ang = ent.GetAngles();
									pos.z += 5;
									local normalcarEntityGroup = null;
									IncludeScript(::entitygroups_car+"change_normalcar_group", g_MapScript);
									normalcarEntityGroup = g_MapScript.GetEntityGroup( "NormalCar" );
									g_MapScript.SpawnSingleAt( normalcarEntityGroup, pos, ang );

									ent.Kill();
									//이상 거의 동일//
								}
							}
						}
					}
				}
			}

			while (ent = Entities.FindByClassname(ent, "prop_physics"))
			{
				if(ent.IsValid())
				{
					local pos = ent.GetOrigin();
					for(local i = 0; i < ::carChangeVar.controlList.len(); i+=4){
						::carChangeVar.controlList[i] = ::carChangeVar.controlList[i].tointeger();
						::carChangeVar.controlList[i+1] = ::carChangeVar.controlList[i+1].tointeger();
						::carChangeVar.controlList[i+2] = ::carChangeVar.controlList[i+2].tointeger();
						
						local tgOri = Vector(::carChangeVar.controlList[i], ::carChangeVar.controlList[i+1], ::carChangeVar.controlList[i+2]);
						if((pos - tgOri).Length() < 10){
							if(::carChangeVar.controlList[i+3] == ent.GetModelName()){
								local ang = ent.GetAngles();
								pos.z += 5;
								ang.y += ::CarAngleFix(ent.GetModelName());
								if(ang.y >= 360)ang.y -= 360;

								IncludeScript(::entitygroups_car+"manacat_alarmcar95sedan", g_MapScript);
								local car = g_MapScript.GetEntityGroup( "Obj" );
								g_MapScript.SpawnSingleAt( car, pos, ang );
								alarmArray[++alarmArrayIndex] <- ent.GetOrigin();

								ent.Kill();
							}
						}
					}
				}
			}
		}else{
			::carChangeVar.controlList = {};
			::carChangeVar.controlIndex = -1
			//난이도가 고급/전문가면 확률 조금 낮게
			if(Convars.GetStr("z_difficulty").tolower() == "hard" || Convars.GetStr("z_difficulty").tolower() == "impossible")probability++;

			while (ent = Entities.FindByClassname(ent, "prop_car_alarm"))
			{
				if(ent.IsValid())
				{
					if(ent.GetModelName() == "models/props_vehicles/cara_95sedan.mdl"){
						if(RandomInt(1,probability)==1){
							//이하 동일//
							local pos = ent.GetOrigin();
							local ang = ent.GetAngles();
							::carChangeVar.controlList[++::carChangeVar.controlIndex] <- pos.x+" "+pos.y+" "+pos.z+" normalcar";
							pos.z += 5;
							local normalcarEntityGroup = null;
							::modelName <- ["models/props_vehicles/cara_95sedan_wrecked.mdl", "models/props_vehicles/cara_95sedan_wrecked_glass.mdl", ::colorSet()];
							IncludeScript(::entitygroups_car+"prop_car_base", g_MapScript);
							normalcarEntityGroup = g_MapScript.GetEntityGroup( "Obj" );
							g_MapScript.SpawnSingleAt( normalcarEntityGroup, pos, ang );

							ent.Kill();
							//이상 동일//
						}else{
							//ent가 일반 차로 변환되지 않은 경우엔 위치 배열에 추가
							alarmArray[++alarmArrayIndex] <- ent.GetOrigin();
						}
					}
				}
			}
			
			local cars = 0; //차량 수를 미리 세어보고 너무 많다 싶으면 확률을 좀 더 넉넉히
			while (ent = Entities.FindByClassname(ent, "prop_physics"))
			{
				if(ent.IsValid())
				{
					if(ent.GetName().find("Change") == null){//이미 변환한 알람차는 제외
						local car = ent.GetModelName();
						
						if(car == "models/props_vehicles/cara_95sedan.mdl" ||
						car == "models/props_vehicles/cara_95sedan_wrecked.mdl" ||
						car == "models/props_vehicles/cara_82hatchback.mdl" ||
						car == "models/props_vehicles/cara_82hatchback_wrecked.mdl" ||
						car == "models/props_vehicles/cara_84sedan.mdl" ||
						car == "models/props_vehicles/cara_69sedan.mdl" ||
						car == "models/props_vehicles/police_car.mdl" ||
						car == "models/props_vehicles/police_car_rural.mdl" ||
						car == "models/props_vehicles/taxi_cab.mdl" ||
						car == "models/props_vehicles/taxi_city.mdl" ||
						car == "models/props_vehicles/taxi_rural.mdl" ||
						car == "models/props_foliage/tree_trunk_fallen.mdl" ||
						car == "models/props_vehicles/utility_truck.mdl" ||
						car == "models/props_vehicles/van.mdl" ||
						car == "models/props_vehicles/pickup_truck_78.mdl" ||
						car == "models/props_vehicles/pickup_truck_2004.mdl" ||
						car == "models/props_vehicles/airport_baggage_cart2.mdl")
						{
							cars++;
						}
					}
				}
			}
			if(cars >= 8)probability++;
			if(cars >= 17)probability++;
			if(cars >= 27)probability++;
			if(cars >= 40)probability++;

			local passToNext = false;
			while (ent = Entities.FindByClassname(ent, "prop_physics"))
			{
				if(ent.IsValid() && (RandomInt(1,probability)==1 || passToNext == true))
				{
					if(ent.GetName().find("Change") == null){
						//바꾸면 안되는 차량 예외처리
						if(NameChk(ent.GetName(), ent.GetModelName(), mapName) == false)continue;

						local car = ent.GetModelName();
						local pos = ent.GetOrigin();

						passToNext = false;

						for(local i = 0; i < alarmArray.len(); i++){
							if((pos - alarmArray[i]).Length() < 600){
								passToNext = true; // 이 차 주변에 다른 알람차가 이미 너무 가까이 있으므로 이 차가 당첨된 변환 기회을 다음 차를 찾아서 넘긴다
								break;
							}
						}

						if(passToNext == true)continue;

						local ang = ent.GetAngles();

						if(!::CarChangeFunc.standCheck(ent)){
							//printl("뒤집힌 차 " + ent.GetModelName());
							continue;
						}

						//일부 차량 모델링이 각도가 돌아가 있어서 보정
						ang.y += ::CarAngleFix(car);
						if(ang.y >= 360)ang.y -= 360;
						if(car == "models/props_vehicles/cara_95sedan.mdl" ||
						car == "models/props_vehicles/cara_95sedan_wrecked.mdl" ||
						car == "models/props_vehicles/cara_82hatchback.mdl" ||
						car == "models/props_vehicles/cara_82hatchback_wrecked.mdl" ||
						car == "models/props_vehicles/cara_84sedan.mdl" ||
						car == "models/props_vehicles/cara_69sedan.mdl" ||
						car == "models/props_vehicles/police_car.mdl" ||
						car == "models/props_vehicles/police_car_rural.mdl" ||
						car == "models/props_vehicles/taxi_cab.mdl" ||
						car == "models/props_vehicles/taxi_city.mdl" ||
						car == "models/props_vehicles/taxi_rural.mdl" ||
						car == "models/props_foliage/tree_trunk_fallen.mdl" ||
						car == "models/props_vehicles/utility_truck.mdl" ||
						car == "models/props_vehicles/van.mdl" ||
						car == "models/props_vehicles/pickup_truck_78.mdl" ||
						car == "models/props_vehicles/pickup_truck_2004.mdl" ||
						car == "models/props_vehicles/airport_baggage_cart2.mdl")
						{
							::carChangeVar.controlList[++::carChangeVar.controlIndex] <- pos.x+" "+pos.y+" "+pos.z+" "+car;
							pos.z += 5;
							IncludeScript(::entitygroups_car+"manacat_alarmcar95sedan", g_MapScript);
							car = g_MapScript.GetEntityGroup( "Obj" );
							g_MapScript.SpawnSingleAt( car, pos, ang );
							alarmArray[++alarmArrayIndex] <- ent.GetOrigin();

							ent.Kill();
						}
					}
				}
			}
			//printl("집계 차량 대수 : " + cars);
			//printl("변환 확률 계수 : " + probability);
			//printl("변환된 차량 수 : " + alarmArray.len());
		}
		::saveloadcar();
		::MANACAT.carController.check <- true;
	}

	function NameChk(carName, modelName, mapName){
		switch(mapName){
		case "c8m2" ://무자비 2챕터
			if(carName == "taxi01")return false;
			//이 차를 바꾸면 조명등이 남는다
			break;
		case "c3m1" ://말라리아 1챕터
		case "c3m2" ://말라리아 2챕터
		case "c3m3" ://말라리아 3챕터
			if(modelName == "models/props_foliage/tree_trunk_fallen.mdl")return false;
			//말라리아에서는 쓰러진 통나무 위치에 자동차가 대체되는 것이 안어울림
			break;
		}

		return true;
	}
	CarChanger();
}

::CarChangeFunc<-{
	function OnGameEvent_round_start_post_nav(params){
		RestoreTable("carspawn", ::carChangeVar.sessionData);
		if(::carChangeVar.sessionData.len() != 0){
			//printl("플레이 맵 "+::carChangeVar.sessionData["mapname"]);
		}else{
			::carChangeVar.sessionData["mapname"] <- "-";
		}
		if("objectSpawner" in ::MANACAT)return;
		if(::MANACAT.carController.check == false)::carChanger();
		if("itemSpawner" in ::MANACAT)if(::MANACAT.itemSpawner.check == false)::ItemSpawner(false);
		// if("objectSpawner" in ::MANACAT){
		// 	printl("<Car Controller> processed first: Object Spawner");
		// 	::levelChanger();
		// }
		// if("itemSpawner" in ::MANACAT)::ItemSpawner();
		// ::carChanger();
	}

	function OnGameEvent_round_end(params){
		::MANACAT.carController.check <- false;
		
		::carChangeVar.sessionData["mapname"] <- Director.GetMapName();
		SaveTable("carspawn", ::carChangeVar.sessionData);
	}

	function OnGameEvent_player_say(params){
		local _chat = params.text;
	
		///*//개발중 확인용
		if(_chat == "!alarmrespawn"){
			::carChanger();
			ClientPrint( null, 5, "Object Director: \x01Object respawned.");
		}else if(_chat == "!alarmrespawnAll"){
			::carChanger();
		}
		
		//*/
	}

	function standCheck(ent, tolerance=35){
		local startpos = ent.GetOrigin();
		local endpos = Vector(startpos.x, startpos.y, startpos.z+100);
		local targetNorm = Vector(endpos.x, endpos.y, endpos.z);
		targetNorm.x -= startpos.x;	targetNorm.y -= startpos.y;	targetNorm.z -= startpos.z;
		targetNorm.x = targetNorm.x/targetNorm.Norm();
		targetNorm.y = targetNorm.y/targetNorm.Norm();
		targetNorm.z = targetNorm.z/targetNorm.Norm();

		if(180/PI*acos(ent.GetAngles().Up().Dot(targetNorm)) < tolerance){
			return true;
		}
		return false;
	}
}

::CarAngleFix <- function(carmodel){
	if(carmodel == "models/props_vehicles/police_car.mdl" ||
	carmodel == "models/props_vehicles/police_car_rural.mdl" ||
	carmodel == "models/props_vehicles/taxi_cab.mdl" ||
	carmodel == "models/props_vehicles/taxi_city.mdl" ||
	carmodel == "models/props_vehicles/taxi_rural.mdl" ||
	carmodel == "models/props_foliage/tree_trunk_fallen.mdl" ||
	carmodel == "models/props_vehicles/van.mdl" ||
	carmodel == "models/props_vehicles/airport_baggage_cart2.mdl"){
		return 90;
	}else if(carmodel == "models/props_vehicles/utility_truck.mdl"){
		return 180;
	}
	return 0;
}

::saveloadcar <- function(){
	local mapName = Director.GetMapName();
	local saveload = null;

	switch(mapName){ //장대비는 대전모드와 관계없이 저장해야함
		case "c4m1_milltown_a": case "c4m2_sugarmill_a": saveload = "save"; break;
		case "c4m3_sugarmill_b": case "c4m4_milltown_b": case "c4m5_milltown_escape": saveload = "load"; break;
	}

	if(::mp_gamemode == "versus"){
		if(::carChangeVar.sessionData["mapname"] == mapName){
			saveload = "load";
		}else{
			saveload = "save";
			if(mapName == "c4m3_sugarmill_b" || mapName == "c4m4_milltown_b" || mapName == "c4m5_milltown_escape")saveload = "load";
		}
	}

	//장대비
	if(mapName == "c4m3_sugarmill_b")mapName = "c4m2_sugarmill_a";
	else if(mapName == "c4m4_milltown_b" || mapName == "c4m5_milltown_escape")mapName = "c4m1_milltown_a";

	if(saveload == "save"){
		local carlist = "";
		for(local i = 0; i < ::carChangeVar.controlList.len(); i++)carlist += ::carChangeVar.controlList[i]+" ";

		StringToFile("car/"+mapName+"_carlist.txt", carlist);
	}else if(saveload == "load"){
		local carlist = FileToString("car/"+mapName+"_carlist.txt");
		carlist = split(carlist, " ");

		::carChangeVar.controlList = {};
		::carChangeVar.controlIndex = -1;
		for(local i = 0; i < carlist.len(); i+=4){
			::carChangeVar.controlList[++::carChangeVar.controlIndex] <- carlist[i];
			::carChangeVar.controlList[++::carChangeVar.controlIndex] <- carlist[i+1];
			::carChangeVar.controlList[++::carChangeVar.controlIndex] <- carlist[i+2];
			::carChangeVar.controlList[++::carChangeVar.controlIndex] <- carlist[i+3];
		}
		return false;
	}
	return true;
}

__CollectEventCallbacks(::CarChangeFunc, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);