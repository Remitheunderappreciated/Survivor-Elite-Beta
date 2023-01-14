Convars.SetValue("sv_consistency", 0);
Convars.SetValue("sv_pure_kick_clients", 0);

IncludeScript("manacatTimer");

::CaralarmVocalVars<-
{
	zoeyList = [
		"scenes/TeenGirl/LookOut01.vcd",//Look out!
		"scenes/TeenGirl/LookOut03.vcd", //Watch out!
		"scenes/TeenGirl/DLC2M2Directional02.vcd", //Don't shoot that car!
		"scenes/TeenGirl/DLC2M2Directional02.vcd", //Don't shoot that car!
	]
	francisList = [
		"scenes/Biker/LookOut01.vcd"  //Look out!
		"scenes/Biker/LookOut02.vcd"  //Look out!
		"scenes/Biker/LookOut03.vcd"  //Watch out!
		"scenes/Biker/LookOut04.vcd"  //Watch out!
		"scenes/Biker/LookOut06.vcd"  //Heads up!
		"scenes/Biker/FriendlyFire10.vcd"  //Watch where you're shooting!
		"scenes/Biker/FriendlyFire12.vcd"  //Watch where you point that thing
	]
	louisList = [
		"scenes/Manager/LookOut01.vcd", //Look out!
		"scenes/Manager/LookOut02.vcd", //Look out!
		"scenes/Manager/LookOut03.vcd", //Watch out!
		"scenes/Manager/LookOut04.vcd", //Watch out!
		"scenes/Manager/LookOut05.vcd", //Heads up!
		"scenes/Manager/LookOut06.vcd", //Heads up!
		"scenes/Manager/DLC2M2Directional07.vcd", //Don't shoot that car!
		"scenes/Manager/DLC2M2Directional07.vcd", //Don't shoot that car!
		"scenes/Manager/DLC2M2Directional07.vcd", //Don't shoot that car!
		"scenes/Manager/DLC2M2Directional07.vcd", //Don't shoot that car!
		"scenes/Manager/DLC2M2Directional07.vcd", //Don't shoot that car!
		"scenes/Manager/DLC2M2Directional07.vcd", //Don't shoot that car!
	]
	billList = [
		"scenes/NamVet/FriendlyFire14.vcd"  //Check your fire!
		"scenes/NamVet/LookOut01.vcd"  //Look out!
		"scenes/NamVet/LookOut02.vcd"  //Watch out!
		"scenes/NamVet/LookOut03.vcd"  //Watch out!
		"scenes/NamVet/LookOut05.vcd"  //Heads up!
		"scenes/NamVet/FriendlyFire08.vcd"  //Watch where you're shooting!
	]
	nickList = [
		"scenes/Gambler/World112.vcd"  //Don't shoot that car!
		"scenes/Gambler/World112.vcd"  //Don't shoot that car!
		"scenes/Gambler/World112.vcd"  //Don't shoot that car!
		"scenes/Gambler/World418.vcd"  //Watch out for CARS!
		"scenes/Gambler/World418.vcd"  //Watch out for CARS!
		"scenes/Gambler/World418.vcd"  //Watch out for CARS!
		"scenes/Gambler/LookOut01.vcd"  //Look out!
		"scenes/Gambler/LookOut02.vcd"  //Watch out!
		"scenes/Gambler/LookOut03.vcd"  //Heads up!
	]
	ellisList = [
		"scenes/Mechanic/World108.vcd"  //Y'all better not shoot that car.
		"scenes/Mechanic/World109.vcd"  //Hey, don't shoot the car.
		"scenes/Mechanic/World429.vcd"  //Hey, watch out for the cars.
		"scenes/Mechanic/World430.vcd"  //Stay away from them cars!
		"scenes/Mechanic/World429.vcd"  //Watch out for the cars!
		"scenes/Mechanic/LookOut01.vcd"  //Hey look out!
		"scenes/Mechanic/LookOut02.vcd"  //Hey watch out!
		"scenes/Mechanic/LookOut03.vcd"  //Look out now!
		"scenes/Mechanic/World211.vcd"  //Watch where you're aimin'.
	]
	ellisList2 = [
		"scenes/Mechanic/World108.vcd"  //Y'all better not shoot that car.
		"scenes/Mechanic/World109.vcd"  //Hey, don't shoot the car.
		"scenes/Mechanic/World429.vcd"  //Hey, watch out for the cars.
		"scenes/Mechanic/World430.vcd"  //Stay away from them cars!
		"scenes/Mechanic/World429.vcd"  //Watch out for the cars!
	]
	coachList = [
		"scenes/Coach/LookOut01.vcd"  //Look out!
		"scenes/Coach/LookOut02.vcd"  //Look out!
		"scenes/Coach/LookOut04.vcd"  //Watch out!
		"scenes/Coach/WorldC5M3B19.vcd"  //Alarms everywhere, people. Watch yourselves!
		"scenes/Coach/WorldC5M3B20.vcd"  //Alarms everywhere, people. Watch yourselves!
		"scenes/Coach/WorldC5M3B23.vcd"  //Move careful, watch your fire, and we'll be just fine.
		"scenes/Coach/WorldC5M3B24.vcd"  //Move careful, watch your fire, and we'll be just fine.
	]
	rochelleList = [
		"scenes/Producer/WorldC5M3B03.vcd"  //Careful, alarm cars everywhere.
		"scenes/Producer/WorldC5M3B03.vcd"  //Careful, alarm cars everywhere.
		"scenes/Producer/WorldC5M3B03.vcd"  //Careful, alarm cars everywhere.
		"scenes/Producer/WorldC5M3B03.vcd"  //Careful, alarm cars everywhere.
		"scenes/Producer/LookOut01.vcd"  //Look out!
		"scenes/Producer/LookOut02.vcd"  //Watch out!
		"scenes/Producer/LookOut03.vcd"  //Heads up!
		"scenes/Producer/WorldC5M3B05.vcd"  //Everyone, just watch where you shoot.
	]

	zoeyShitList = [
		"scenes/TeenGirl/Swear02.vcd"  //Shit.
		"scenes/TeenGirl/Swear06.vcd"  //Mother.
		"scenes/TeenGirl/Swear10.vcd"  //Dammit.
		"scenes/TeenGirl/Swear12.vcd"  //Shit.
		"scenes/TeenGirl/Swear13.vcd"  //Goddammit.
		"scenes/TeenGirl/Swear22.vcd"  //Dammit.
		"scenes/TeenGirl/ReactionNegative31.vcd"  //Shit  (matter of factly)
		"scenes/TeenGirl/ReactionNegative17.vcd"  //Shit  (matter of factly)
	]
	francisShitList = [
		"scenes/Biker/ReactionStartled04.vcd"  //What the?
		"scenes/Biker/Swear01.vcd"  //Goddammit.
		"scenes/Biker/Swear02.vcd"  //Shit.
		"scenes/Biker/Swear04.vcd"  //Ah hell.
		"scenes/Biker/Swear12.vcd"  //Shit.
		"scenes/Biker/Swear17.vcd"  //Dammit.
		"scenes/Biker/Swear09.vcd"  //Dammit.
		"scenes/Biker/Swear10.vcd"  //Bullshit.
		"scenes/Biker/ReactionNegative05.vcd"  //Shit
		"scenes/Biker/ReactionNegative07.vcd"  //Dammit.
		"scenes/Biker/ReactionNegative08.vcd"  //Damnit.
		"scenes/Biker/ReactionNegative09.vcd"  //Ahhhhh.
	]
	louisShitList = [
		"scenes/Manager/Swears02.vcd"  //Dammit.
		"scenes/Manager/Swears05.vcd"  //Shit.
		"scenes/Manager/Swears10.vcd"  //Dammit.
		"scenes/Manager/Swears12.vcd"  //Shit.
	]
	billShitList = [
		"scenes/NamVet/ReactionNegative01.vcd"  //Uh oh
		"scenes/NamVet/ReactionNegative10.vcd"  //Dammit.
		"scenes/NamVet/Swears08.vcd"  //Dammit.
		"scenes/NamVet/Swears12.vcd"  //Ah shit.
	]
	coachShitList = [
		"scenes/Coach/ReactionNegative02.vcd"  //What the f-
		"scenes/Coach/ReactionNegative03.vcd"  //Damn!
		"scenes/Coach/ReactionNegative07.vcd"  //hhhhhhh [frustrated]
		"scenes/Coach/ReactionNegative08.vcd"  //Goddamnit!
		"scenes/Coach/ReactionNegative09.vcd"  //Shiiit.
		"scenes/Coach/ReactionNegative15.vcd"  //Goddamn!
		"scenes/Coach/ReactionNegative18.vcd"  //Goddamn!
		"scenes/Coach/ReactionNegative20.vcd"  //Bullshit.
	]
	nickShitList = [
		"scenes/Gambler/ReactionNegative02.vcd"  //Damn...
		"scenes/Gambler/ReactionNegative03.vcd"  //Shit!
		"scenes/Gambler/ReactionNegative05.vcd"  //Bullshit!
		"scenes/Gambler/ReactionNegative11.vcd"  //Oh bullshit!
		"scenes/Gambler/ReactionNegative14.vcd"  //Damn...
		"scenes/Gambler/ReactionNegative15.vcd"  //Shit!
		"scenes/Gambler/ReactionNegative17.vcd"  //Bullshit!
		"scenes/Gambler/ReactionNegative19.vcd"  //Shit!
		"scenes/Gambler/ReactionNegative22.vcd"  //Oh bullshit!
	]
	ellisShitList = [
		"scenes/Mechanic/ReactionNegative02.vcd"  //Ahh SHIT!
		"scenes/Mechanic/ReactionNegative03.vcd"  //God DAMN!
		"scenes/Mechanic/ReactionNegative07.vcd"  //Oh SHIT!
		"scenes/Mechanic/ReactionNegative08.vcd"  //God DAMN!
	]
	rochelleShitList = [
		"scenes/Producer/ReactionNegative02.vcd"  //Damnn...
		"scenes/Producer/ReactionNegative04.vcd"  //Oh shit!
		"scenes/Producer/ReactionNegative21.vcd"  //Jesus Christ!
	]
}

::speakCarVocal <- function(params){
	local speaker = params["speaker"];
	if(speaker == null || speaker == false || speaker == true)return;
	local vocal = params["vocal"];
	//printl("["+speaker.GetPlayerName()+"]발화 "+vocal);

	if(speaker.IsIncapacitated() == false && speaker.IsDominatedBySpecialInfected() == false)speaker.PlayScene(vocal, 0.0);
}

::carVocalSelect <- function(params){
	local speaker = params["speaker"];
	if(speaker == null || speaker == false || speaker == true)return;
	local code = params["code"];
	local pmodel = speaker.GetModelName();
	local vocal = "";
	switch(code){
		case "shit" :
			switch(pmodel){
				case "models/survivors/survivor_teenangst.mdl":
					vocal = ::CaralarmVocalVars.zoeyShitList[RandomInt(0,::CaralarmVocalVars.zoeyShitList.len()-1)];
				break;
				case "models/survivors/survivor_biker.mdl":
					vocal = ::CaralarmVocalVars.francisShitList[RandomInt(0,::CaralarmVocalVars.francisShitList.len()-1)];
				break;
				case "models/survivors/survivor_namvet.mdl":
					vocal = ::CaralarmVocalVars.billShitList[RandomInt(0,::CaralarmVocalVars.billShitList.len()-1)];
				break;
				case "models/survivors/survivor_manager.mdl":
					vocal = ::CaralarmVocalVars.louisShitList[RandomInt(0,::CaralarmVocalVars.louisShitList.len()-1)];
				break;
				case "models/survivors/survivor_mechanic.mdl":
					vocal = ::CaralarmVocalVars.ellisShitList[RandomInt(0,::CaralarmVocalVars.ellisShitList.len()-1)];
				break;
				case "models/survivors/survivor_producer.mdl":
					vocal = ::CaralarmVocalVars.rochelleShitList[RandomInt(0,::CaralarmVocalVars.rochelleShitList.len()-1)];
				break;
				case "models/survivors/survivor_gambler.mdl":
					vocal = ::CaralarmVocalVars.nickShitList[RandomInt(0,::CaralarmVocalVars.nickShitList.len()-1)];
				break;
				case "models/survivors/survivor_coach.mdl":
					vocal = ::CaralarmVocalVars.coachShitList[RandomInt(0,::CaralarmVocalVars.coachShitList.len()-1)];
				break;
			}
		break;
		case "car" :
			switch(pmodel){
				case "models/survivors/survivor_teenangst.mdl":
					vocal = ::CaralarmVocalVars.zoeyList[RandomInt(0,::CaralarmVocalVars.zoeyList.len()-1)];
				break;
				case "models/survivors/survivor_biker.mdl":
					vocal = ::CaralarmVocalVars.francisList[RandomInt(0,::CaralarmVocalVars.francisList.len()-1)];
				break;
				case "models/survivors/survivor_namvet.mdl":
					vocal = ::CaralarmVocalVars.billList[RandomInt(0,::CaralarmVocalVars.billList.len()-1)];
				break;
				case "models/survivors/survivor_manager.mdl":
					vocal = ::CaralarmVocalVars.louisList[RandomInt(0,::CaralarmVocalVars.louisList.len()-1)];
				break;
				case "models/survivors/survivor_mechanic.mdl":
					vocal = ::CaralarmVocalVars.ellisList[RandomInt(0,::CaralarmVocalVars.ellisList.len()-1)];
				break;
				case "models/survivors/survivor_producer.mdl":
					vocal = ::CaralarmVocalVars.rochelleList[RandomInt(0,::CaralarmVocalVars.rochelleList.len()-1)];
				break;
				case "models/survivors/survivor_gambler.mdl":
					vocal = ::CaralarmVocalVars.nickList[RandomInt(0,::CaralarmVocalVars.nickList.len()-1)];
				break;
				case "models/survivors/survivor_coach.mdl":
					vocal = ::CaralarmVocalVars.coachList[RandomInt(0,::CaralarmVocalVars.coachList.len()-1)];
				break;
			}
		break;
		case "car2" :
			switch(pmodel){
				case "models/survivors/survivor_teenangst.mdl":
					vocal = "scenes/TeenGirl/DLC2M2Directional02.vcd";
				break;
				case "models/survivors/survivor_manager.mdl":
					vocal = "scenes/Manager/DLC2M2Directional07.vcd";
				break;
				case "models/survivors/survivor_namvet.mdl":
					vocal = ::CaralarmVocalVars.billList[RandomInt(0,::CaralarmVocalVars.billList.len()-1)];
				break;
				case "models/survivors/survivor_biker.mdl":
					vocal = ::CaralarmVocalVars.francisList[RandomInt(0,::CaralarmVocalVars.francisList.len()-1)];
				break;
				case "models/survivors/survivor_mechanic.mdl":
					vocal = ::CaralarmVocalVars.ellisList2[RandomInt(0,::CaralarmVocalVars.ellisList2.len()-1)];
				break;
				case "models/survivors/survivor_producer.mdl":
					vocal = ::CaralarmVocalVars.rochelleList[RandomInt(0,::CaralarmVocalVars.rochelleList.len()-1)];
				break;
				case "models/survivors/survivor_gambler.mdl":
					vocal = "scenes/gambler/world112.vcd";
				break;
				case "models/survivors/survivor_coach.mdl":
					vocal = ::CaralarmVocalVars.coachList[RandomInt(0,::CaralarmVocalVars.coachList.len()-1)];
				break;
			}
		break;
	}
	//printl(vocal);
	return vocal;
}

::carTalkerUpdate <- function(params){
	local ent = null;
	while (ent = Entities.FindByClassname(ent, "player")){
		if(ent.IsValid()){
			if(ent.GetZombieType() == 9){
				::caralarmTalker.focusChk(ent);
			}
		}
	}

	//printl(::itemExVars.exTime[0]+" "+::itemExVars.exTime[1]+" "+::itemExVars.exTime[2]+" "+::itemExVars.exTime[3]+" "+::itemExVars.exTime[4]+" "+::itemExVars.exTime[5]+" "+::itemExVars.exTime[6]+" "+::itemExVars.exTime[7]);
}

::carTalkerTimer <- function(params){
	local car = params["car"];
	if(car.IsValid()){
		if(car.GetHealth() == 2){
			car.SetHealth(1);
		}
	}
}

::caralarmTalker<-
{
	OnGameEvent_round_start_post_nav = function(params){
		::manacatAddTimerByName("carTalk", 0.1, true, ::carTalkerUpdate);
	}

	function findSurvivor(nameArray, exname, allowsame = 0, oriV = null, distV = 0){
		local ent = null;
		local len = nameArray.len();
		local tg = RandomInt(0,len-1);
		for(local i = 0; i < len; i++){
			local pname = "models/survivors/survivor_"+nameArray[tg]+".mdl"
			while (ent = Entities.FindByClassname(ent, "player")){
				if(ent.IsValid()){
					local entModel = ent.GetModelName();
					if(entModel == pname && ent.IsDead() == false && ent.IsIncapacitated() == false){
						if(entModel == exname){
							if(allowsame == 0){//동일 비허용, 탐색 계속
								continue;
							}else if(allowsame == 1){//동일 비허용, 탐색 중단
								return null;
							}else if(allowsame == 2){//동일 비허용, 탐색 완전중단 (다른 발화자에게 발화가 넘어가지 않게)
								return false;
							}else if(allowsame == 3){//동일 허용, 50% 확률로 계속
								if(RandomInt(1,2) == 1)return ent;
								else continue;
							}else if(allowsame == 4){//동일 허용, 50% 확률로 중단
								if(RandomInt(1,2) == 1)return ent;
								else return null;
							}else if(allowsame == 5){//동일 허용
								return ent;
							}
						}
						if(oriV != null){
							local dist = (ent.GetOrigin() - oriV).Length();												//printl(nameArray[tg]+" 거리 "+dist)
							if(dist < distV){
								return ent;
							}
						}else{
							return ent;
						}
					}
				}
			}
			tg++;
			if(tg == len)tg = 0;
		}
		return null;
	}

	function focusChk(_ent){
		local entTable = ::caralarmTalker.GetFocusEntity(_ent);
		for(local i = 0; i < 5; i++){
			local lookingent = entTable[i];
			if(!lookingent) continue;
			local etype = lookingent.GetClassname(); // "player"
			
			if(etype == null || etype != "prop_car_alarm") continue;
			local eflag = lookingent.GetHealth();														//	printl("looking ent "+eflag);
			if(eflag >= 2) continue;
			if(lookingent.GetName().find("Level") == null && lookingent.GetName().find("Change") == null) continue;

			local dist = (lookingent.GetOrigin() - _ent.GetOrigin()).Length();							//	printl("관찰자와의 거리 "+dist);
			local pmodel = _ent.GetModelName();

			if(dist <= 700){
				lookingent.SetHealth(2);
				::manacatAddTimer(40, false, ::carTalkerTimer, { car = lookingent });
				local delay = 0.2;
				local speakcode = "";
				if(dist <= 300 && eflag == 0){
					speakcode = ::carVocalSelect({speaker = _ent, code = "shit"});
					::manacatAddTimer(delay, false, ::speakCarVocal, { speaker = _ent, vocal = speakcode });
					delay += 1.1;
				}
				speakcode = ::carVocalSelect({speaker = _ent, code = "car"});
				::manacatAddTimer(delay, false, ::speakCarVocal, { speaker = _ent, vocal = speakcode });
				
				local speaker = null;
				switch(pmodel){
					case "models/survivors/survivor_biker.mdl":		case "models/survivors/survivor_namvet.mdl":
						speaker = findSurvivor(["teenangst","manager"], pmodel, 0, _ent.GetOrigin(), 690);
						if(speaker == null)	speaker = findSurvivor(["namvet","biker"], pmodel, 0, _ent.GetOrigin(), 690);
						speakcode = ::carVocalSelect({speaker = speaker, code = "car2"});
					break;
					case "models/survivors/survivor_teenangst.mdl":		case "models/survivors/survivor_manager.mdl":
						if(speakcode == "scenes/TeenGirl/DLC2M2Directional02.vcd" || speakcode == "scenes/Manager/DLC2M2Directional07.vcd"){
							speaker = findSurvivor(["namvet","biker","manager","teenangst"], pmodel, 0, _ent.GetOrigin(), 690);
							speakcode = ::carVocalSelect({speaker = speaker, code = "car"});
						}else{
							speaker = findSurvivor(["manager","teenangst"], pmodel, 3, _ent.GetOrigin(), 690);
							if(speaker == null)	speaker = findSurvivor(["namvet","biker"], pmodel, 3, _ent.GetOrigin(), 690);
							speakcode = ::carVocalSelect({speaker = speaker, code = "car2"});
						}
					break;

					case "models/survivors/survivor_coach.mdl":		case "models/survivors/survivor_producer.mdl":
						speaker = findSurvivor(["mechanic","gambler"], pmodel, 0, _ent.GetOrigin(), 690);
						if(speaker == null)	speaker = findSurvivor(["coach","producer"], pmodel, 0, _ent.GetOrigin(), 690);
						speakcode = ::carVocalSelect({speaker = speaker, code = "car2"});
					break;
					case "models/survivors/survivor_mechanic.mdl":		case "models/survivors/survivor_gambler.mdl":
						if(speakcode == "scenes/Mechanic/World108.vcd" || speakcode == "scenes/Mechanic/World109.vcd"
						|| speakcode == "scenes/Mechanic/World429.vcd" || speakcode == "scenes/Gambler/World112.vcd"){
							speaker = findSurvivor(["coach","producer","gambler","mechanic"], pmodel, 0, _ent.GetOrigin(), 690);
							speakcode = ::carVocalSelect({speaker = speaker, code = "car"});
						}else{
							speaker = findSurvivor(["gambler","mechanic"], pmodel, 3, _ent.GetOrigin(), 690);
							if(speaker == null)	speaker = findSurvivor(["coach","producer"], pmodel, 3, _ent.GetOrigin(), 690);
							speakcode = ::carVocalSelect({speaker = speaker, code = "car2"});
						}
					break;
				}
				if(speaker != null){
					delay += 1.9;																							//printl("이어받기 "+speaker);
					::manacatAddTimer(delay, false, ::speakCarVocal, { speaker = speaker, vocal = speakcode });
				}
			}
		}
	}

	function GetFocusEntity(_ent){
		if(_ent.IsValid){
			if (!("EyeAngles" in _ent)){
				return;
			}

			local startPt = _ent.EyePosition();
			local tempPt = _ent.EyeAngles();
			local endPt = startPt + tempPt.Forward().Scale(999999);
	
			local m_trace = { start = startPt, end = endPt, ignore = _ent, mask = 33579137 };
			TraceLine(m_trace);
			
			tempPt.y -= 20;		tempPt.x += 5;
			local endPtL = startPt + tempPt.Forward().Scale(999999);
			local m_traceLup = { start = startPt, end = endPtL, ignore = _ent, mask = 33579137 };
			TraceLine(m_traceLup);
			tempPt.x -= 10;
			local endPtL = startPt + tempPt.Forward().Scale(999999);
			local m_traceLdown = { start = startPt, end = endPtL, ignore = _ent, mask = 33579137 };
			TraceLine(m_traceLdown);

			tempPt.y += 40;		tempPt.x += 10;
			local endPtR = startPt + tempPt.Forward().Scale(999999);
			local m_traceRup = { start = startPt, end = endPtR, ignore = _ent, mask = 33579137 };
			TraceLine(m_traceRup);
			tempPt.x -= 10;
			local endPtR = startPt + tempPt.Forward().Scale(999999);
			local m_traceRdown = { start = startPt, end = endPtR, ignore = _ent, mask = 33579137 };
			TraceLine(m_traceRdown);
	
			tempPt = [null,null,null,null,null];

			if (m_trace.hit && m_trace.enthit != null && m_trace.enthit != _ent)
				if (m_trace.enthit.GetClassname() == "prop_car_alarm" && m_trace.enthit.IsValid())
					tempPt[0] = m_trace.enthit;
			if (m_traceLup.hit && m_traceLup.enthit != null && m_traceLup.enthit != _ent)
				if (m_traceLup.enthit.GetClassname() == "prop_car_alarm" && m_traceLup.enthit.IsValid())
					tempPt[1] = m_traceLup.enthit;
			if (m_traceRup.hit && m_traceRup.enthit != null && m_traceRup.enthit != _ent)
				if (m_traceRup.enthit.GetClassname() == "prop_car_alarm" && m_traceRup.enthit.IsValid())
					tempPt[2] = m_traceRup.enthit;
			if (m_traceLdown.hit && m_traceLdown.enthit != null && m_traceLdown.enthit != _ent)
				if (m_traceLdown.enthit.GetClassname() == "prop_car_alarm" && m_traceLdown.enthit.IsValid())
					tempPt[3] = m_traceLdown.enthit;
			if (m_traceRdown.hit && m_traceRdown.enthit != null && m_traceRdown.enthit != _ent)
				if (m_traceRdown.enthit.GetClassname() == "prop_car_alarm" && m_traceRdown.enthit.IsValid())
					tempPt[4] = m_traceRdown.enthit;
	
		//	printl("반환"+tempPt[4]+" "+tempPt[3]);
		//	printl("반환      "+tempPt[0]);
		//	printl("반환"+tempPt[2]+" "+tempPt[1]);
			
			return tempPt;
		}else{
			return;
		}
	}
}



__CollectEventCallbacks(::caralarmTalker, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);