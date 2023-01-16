Obj <-
{
	//-------------------------------------------------------
	// Required Interface functions
	//-------------------------------------------------------
	function GetPrecacheList()
	{
		local precacheModels =
		[
			EntityGroup.SpawnTables.Level_caralarm_car1,
			EntityGroup.SpawnTables.Level_caralarm_glass1,
			EntityGroup.SpawnTables.Level_caralarm_light1,
			EntityGroup.SpawnTables.Level_caralarm_light11,
			EntityGroup.SpawnTables.Level_caralarm_light12,
			EntityGroup.SpawnTables.Level_caralarm_light13,
			EntityGroup.SpawnTables.Level_caralarm_glass1_off,
		]
		return precacheModels
	}

	//-------------------------------------------------------
	function GetSpawnList()
	{
		local spawnEnts =
		[
			EntityGroup.SpawnTables.Level_carchirp1,
			//EntityGroup.SpawnTables.Level_remark_caralarm,
			EntityGroup.SpawnTables.Level_caralarm_car1,
			EntityGroup.SpawnTables.Level_alarmtimer1,
			EntityGroup.SpawnTables.Level_caralarm1,
			EntityGroup.SpawnTables.unnamed1,
			EntityGroup.SpawnTables.unnamed,
			EntityGroup.SpawnTables.Level_branch_caralarm,
			EntityGroup.SpawnTables.Level_caralarm_glass1,
			EntityGroup.SpawnTables.Level_relay_caralarm_off,
			EntityGroup.SpawnTables.Level_caralarm_glass1_off,
			EntityGroup.SpawnTables.Level_case_car_color,
			EntityGroup.SpawnTables.Level_relay_caralarm_on,
			EntityGroup.SpawnTables.Level_caralarm_headlights11,
			EntityGroup.SpawnTables.Level_caralarm_headlights1,
			EntityGroup.SpawnTables.Level_caralarm_light13,
			EntityGroup.SpawnTables.Level_caralarm_light12,
			EntityGroup.SpawnTables.Level_caralarm_light11,
			EntityGroup.SpawnTables.Level_caralarm_light1,
		]
		return spawnEnts
	}

	//-------------------------------------------------------
	function GetEntityGroup()
	{
		return EntityGroup
	}

	//-------------------------------------------------------
	// Table of entities that make up this group
	//-------------------------------------------------------
	EntityGroup =
	{
		SpawnTables =
		{
			Level_branch_caralarm = 
			{
				SpawnInfo =
				{
					classname = "logic_branch"
					InitialValue = "$start_off"
					spawnflags = "0"
					targetname = "Level_branch_caralarm"
					connections =
					{
						OnFalse =
						{
							cmd1 = "Level_relay_caralarm_onTrigger0-1"
						}
						OnTrue =
						{
							cmd1 = "Level_relay_caralarm_offTrigger0-1"
						}
					}
				}
			}
			Level_relay_caralarm_off = 
			{
				SpawnInfo =
				{
					classname = "logic_relay"
					spawnflags = "0"
					StartDisabled = "0"
					targetname = "Level_relay_caralarm_off"
					connections =
					{
						OnTrigger =
						{
							cmd1 = "Level_caralarm_game_eventKill0-1"
							cmd2 = "Level_caralarm_car1Disable0-1"
							cmd3 = "Level_relay_caralarm_onEnable0.02-1"
							cmd4 = "Level_relay_caralarm_offDisable0.02-1"
							cmd5 = "Level_remark_caralarmKill0-1"
							cmd6 = "Level_caralarm_glass1_offEnable0-1"
							cmd7 = "Level_caralarm_glass1Disable0-1"
							cmd8 = "Level_caralarm_headlights1LightOff0-1"
							cmd9 = "Level_caralarm_light1HideSprite0-1"
						}
					}
				}
			}
			Level_relay_caralarm_on = 
			{
				SpawnInfo =
				{
					classname = "logic_relay"
					spawnflags = "0"
					StartDisabled = "0"
					targetname = "Level_relay_caralarm_on"
					connections =
					{
						OnTrigger =
						{
							cmd1 = "Level_maker_alarm_onForceSpawn0.01-1"
							cmd2 = "Level_caralarm_car1Enable0-1"
							cmd3 = "Level_relay_caralarm_onDisable0.02-1"
							cmd4 = "Level_relay_caralarm_offEnable0.02-1"
							cmd5 = "Level_caralarm_glass1Enable0-1"
							cmd6 = "Level_caralarm_glass1_offDisable0-1"
						}
					}
				}
			}
			unnamed = 
			{
				SpawnInfo =
				{
					classname = "logic_auto"
					spawnflags = "1"
					connections =
					{
						OnMapSpawn =
						{
							cmd1 = "Level_branch_caralarmTest0.1-1"
						}
					}
				}
			}
			Level_caralarm1 = 
			{
				SpawnInfo =
				{
					classname = "ambient_generic"
					angles = Vector( 0, 0, 0 )
					cspinup = "0"
					fadeinsecs = "0"
					fadeoutsecs = "0"
					health = "10"
					lfomodpitch = "0"
					lfomodvol = "0"
					lforate = "0"
					lfotype = "0"
					message = ::caralarmRNG()
					pitch = "100"
					pitchstart = "100"
					preset = "0"
					radius = "4000"
					SourceEntityName = "Level_caralarm_car1"
					spawnflags = "16"
					spindown = "0"
					spinup = "0"
					targetname = "Level_caralarm1"
					volstart = "0"
					origin = Vector( 0, 0, 110 )
				}
			}
			unnamed1 = 
			{
				SpawnInfo =
				{
					classname = "logic_auto"
					spawnflags = "1"
					connections =
					{
						OnMapSpawn =
						{
							cmd1 = "Level_case_car_colorPickRandom0-1"
						}
					}
				}
			}
			Level_case_car_color = 
			{
				SpawnInfo =
				{
					classname = "logic_case"
					Case01 = "1"
					Case02 = "2"
					Case03 = "3"
					Case04 = "4"
					targetname = "Level_case_car_color"
					connections =
					{
						OnCase04 =
						{
							cmd1 = "Level_caralarm_car1Color153 65 290-1"
						}
						OnCase02 =
						{
							cmd1 = "Level_caralarm_car1Color182 122 680-1"
						}
						OnCase01 =
						{
							cmd1 = "Level_caralarm_car1Color182 92 680-1"
						}
						OnCase03 =
						{
							cmd1 = "Level_caralarm_car1Color114 80 520-1"
						}
					}
				}
			}
			Level_carchirp1 = 
			{
				SpawnInfo =
				{
					classname = "ambient_generic"
					angles = Vector( 0, 0, 0 )
					cspinup = "0"
					fadeinsecs = "0"
					fadeoutsecs = "0"
					health = "10"
					lfomodpitch = "0"
					lfomodvol = "0"
					lforate = "0"
					lfotype = "0"
					message = "Car.Alarm.Chirp2"
					pitch = "100"
					pitchstart = "100"
					preset = "0"
					radius = "4000"
					SourceEntityName = "Level_caralarm_car1"
					spawnflags = "48"
					spindown = "0"
					spinup = "0"
					targetname = "Level_carchirp1"
					volstart = "0"
					origin = Vector( 0, 0, 110 )
				}
			}
			Level_alarmtimer1 = 
			{
				SpawnInfo =
				{
					classname = "logic_timer"
					RefireTime = ".75"
					StartDisabled = "1"
					targetname = "Level_alarmtimer1"
					UseRandomTime = "0"
					connections =
					{
						OnTimer =
						{
							cmd1 = "Level_caralarm_light1ShowSprite0-1"
							cmd2 = "Level_caralarm_light1HideSprite0.5-1"
							cmd3 = "Level_caralarm_light1HideSprite0.5-1"
							cmd4 = "Level_caralarm_light1ShowSprite0-1"
							cmd5 = "Level_caralarm_headlights1LightOff0.5-1"
							cmd6 = "Level_caralarm_headlights1LightOn0-1"
						}
					}
				}
			}
			Level_caralarm_car1 = 
			{
				SpawnInfo =
				{
					classname = "prop_car_alarm"
					angles = Vector( 0, 0, 0 )
					body = "0"
					BreakableType = "0"
					damagetoenablemotion = "0"
					Damagetype = "0"
					disablereceiveshadows = "0"
					disableshadows = "0"
					ExplodeDamage = "0"
					ExplodeRadius = "0"
					fademaxdist = "2250"
					fademindist = "2000"
					fadescale = "1"
					forcetoenablemotion = "0"
					glowcolor = "0 0 0"
					inertiaScale = "1.0"
					massScale = "0"
					maxdxlevel = "0"
					mindxlevel = "0"
					minhealthdmg = "0"
					model = "models/props_vehicles/cara_95sedan.mdl"
					nodamageforces = "0"
					PerformanceMode = "0"
					physdamagescale = "0.1"
					pressuredelay = "0"
					renderamt = "255"
					rendercolor = "138 37 9"
					renderfx = "0"
					rendermode = "0"
					shadowcastdist = "0"
					skin = "0"
					spawnflags = "256"
					targetname = "Level_caralarm_car1"
					origin = Vector( 0, 0, 0 )
					connections =
					{
						OnCarAlarmStart =
						{
							cmd1 = "Level_alarmtimer1Enable0-1"
							cmd2 = "Level_caralarm1PlaySound0-1"
							cmd3 = "Level_caralarm_glass1Disable0-1"
							cmd4 = "Level_caralarm_glass1_offEnable0-1"
							cmd5 = "Level_caralarm_car1SetHealth100-1"
						}
						OnCarAlarmChirpStart =
						{
							cmd1 = "Level_carchirp1PlaySound0.2-1"
							cmd2 = "Level_caralarm_light1ShowSprite0.2-1"
						}
						OnCarAlarmEnd =
						{
							cmd1 = "Level_alarmtimer1Disable0-1"
							cmd2 = "Level_caralarm1StopSound0-1"
							cmd3 = "Level_relay_caralarm_offTrigger0-1"
							cmd4 = "Level_caralarm_light1HideSprite0-1"
							cmd5 = "Level_caralarm_headlights1LightOff0-1"
							cmd6 = "Level_caralarm_game_eventKill0-1"
							cmd7 = "Level_remark_caralarmKill0-1"
						}
						OnCarAlarmChirpEnd =
						{
							cmd1 = "Level_caralarm_light1HideSprite0.7-1"
						}
						OnHitByTank =
						{
							cmd1 = "Level_caralarm_car1SetHealth100-1"
						}
					}
				}
			}
			Level_caralarm_glass1 = 
			{
				SpawnInfo =
				{
					classname = "prop_car_glass"
					angles = Vector( 0, 0, 0 )
					body = "0"
					disablereceiveshadows = "0"
					disableshadows = "0"
					ExplodeDamage = "0"
					ExplodeRadius = "0"
					fademaxdist = "0"
					fademindist = "-1"
					fadescale = "1"
					glowbackfacemult = "1.0"
					glowcolor = "0 0 0"
					MaxAnimTime = "10"
					maxdxlevel = "0"
					MinAnimTime = "5"
					mindxlevel = "0"
					model = "models/props_vehicles/cara_95sedan_glass_alarm.mdl"
					parentname = "Level_caralarm_car1"
					PerformanceMode = "0"
					pressuredelay = "0"
					RandomAnimation = "0"
					renderamt = "255"
					rendercolor = "255 255 255"
					renderfx = "0"
					rendermode = "0"
					SetBodyGroup = "0"
					skin = "0"
					solid = "6"
					spawnflags = "0"
					StartDisabled = "0"
					targetname = "Level_caralarm_glass1"
					origin = Vector( 0, 0, 0 )
				}
			}
			Level_caralarm_headlights1 = 
			{
				SpawnInfo =
				{
					classname = "beam_spotlight"
					angles = Vector( 0, 0, 0 )
					fademindist = "-1"
					fadescale = "1"
					HDRColorScale = ".5"
					maxspeed = "100"
					parentname = "Level_caralarm_car1"
					renderamt = "150"
					rendercolor = "252 243 226"
					rendermode = "5"
					spawnflags = "2"
					spotlightlength = "256"
					spotlightwidth = "32"
					targetname = "Level_caralarm_headlights1"
					origin = Vector( 100, -27.5, 30 )
				}
			}
			Level_caralarm_headlights11 = 
			{
				SpawnInfo =
				{
					classname = "beam_spotlight"
					angles = Vector( 0, 0, 0 )
					fademindist = "-1"
					fadescale = "1"
					HDRColorScale = ".5"
					maxspeed = "100"
					parentname = "Level_caralarm_car1"
					renderamt = "150"
					rendercolor = "252 243 226"
					rendermode = "5"
					spawnflags = "2"
					spotlightlength = "256"
					spotlightwidth = "32"
					targetname = "Level_caralarm_headlights1"
					origin = Vector( 100, 27.5, 30 )
				}
			}
			Level_caralarm_light1 = 
			{
				SpawnInfo =
				{
					classname = "env_sprite"
					angles = Vector( 0, 0, 0 )
					disablereceiveshadows = "0"
					fademindist = "-1"
					fadescale = "1"
					framerate = "10.0"
					GlowProxySize = "5"
					HDRColorScale = "0.7"
					model = "sprites/glow.vmt"
					parentname = "Level_caralarm_car1"
					renderamt = "255"
					rendercolor = "224 162 44"
					renderfx = "0"
					rendermode = "9"
					scale = ".5"
					spawnflags = "0"
					targetname = "Level_caralarm_light1"
					origin = Vector( 96, -38.5, 30 )
				}
			}
			Level_caralarm_light11 = 
			{
				SpawnInfo =
				{
					classname = "env_sprite"
					angles = Vector( 0, 0, 0 )
					disablereceiveshadows = "0"
					fademindist = "-1"
					fadescale = "1"
					framerate = "10.0"
					GlowProxySize = "5"
					HDRColorScale = "0.7"
					model = "sprites/glow.vmt"
					parentname = "Level_caralarm_car1"
					renderamt = "255"
					rendercolor = "224 162 44"
					renderfx = "0"
					rendermode = "9"
					scale = ".5"
					spawnflags = "0"
					targetname = "Level_caralarm_light1"
					origin = Vector( 96, 38.5, 30 )
				}
			}
			Level_caralarm_light12 = 
			{
				SpawnInfo =
				{
					classname = "env_sprite"
					angles = Vector( 0, 0, 0 )
					disablereceiveshadows = "0"
					fademindist = "-1"
					fadescale = "1"
					framerate = "10.0"
					GlowProxySize = "5"
					HDRColorScale = "0.7"
					model = "sprites/glow.vmt"
					parentname = "Level_caralarm_car1"
					renderamt = "255"
					rendercolor = "255 13 19"
					renderfx = "0"
					rendermode = "9"
					scale = ".5"
					spawnflags = "0"
					targetname = "Level_caralarm_light1"
					origin = Vector( -102, 28.5, 30 )
				}
			}
			Level_caralarm_light13 = 
			{
				SpawnInfo =
				{
					classname = "env_sprite"
					angles = Vector( 0, 0, 0 )
					disablereceiveshadows = "0"
					fademindist = "-1"
					fadescale = "1"
					framerate = "10.0"
					GlowProxySize = "5"
					HDRColorScale = "0.7"
					model = "sprites/glow.vmt"
					parentname = "Level_caralarm_car1"
					renderamt = "255"
					rendercolor = "255 13 19"
					renderfx = "0"
					rendermode = "9"
					scale = ".5"
					spawnflags = "0"
					targetname = "Level_caralarm_light1"
					origin = Vector( -102, -28.5, 30 )
				}
			}
			Level_remark_caralarm = 
			{
				SpawnInfo =
				{
					classname = "info_remarkable"
					contextsubject = "remark_caralarm"
					origin = Vector( 0, 0, 100 )
					targetname = "Level_remark_caralarm"
				}
			}
			Level_caralarm_glass1_off = 
			{
				SpawnInfo =
				{
					classname = "prop_car_glass"
					angles = Vector( 0, 0, 0 )
					body = "0"
					disablereceiveshadows = "0"
					disableshadows = "0"
					ExplodeDamage = "0"
					ExplodeRadius = "0"
					fademaxdist = "0"
					fademindist = "-1"
					fadescale = "1"
					glowbackfacemult = "1.0"
					glowcolor = "0 0 0"
					MaxAnimTime = "10"
					maxdxlevel = "0"
					MinAnimTime = "5"
					mindxlevel = "0"
					model = "models/props_vehicles/cara_95sedan_glass.mdl"
					parentname = "Level_caralarm_car1"
					PerformanceMode = "0"
					pressuredelay = "0"
					RandomAnimation = "0"
					renderamt = "255"
					rendercolor = "255 255 255"
					renderfx = "0"
					rendermode = "0"
					SetBodyGroup = "0"
					skin = "0"
					solid = "6"
					spawnflags = "0"
					StartDisabled = "1"
					targetname = "Level_caralarm_glass1_off"
					origin = Vector( 0, 0, 0 )
				}
			}
		} // SpawnTables
	} // EntityGroup
}

RegisterEntityGroup( "Obj", Obj )