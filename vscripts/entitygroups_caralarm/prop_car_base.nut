PrecacheModel(::modelName[0]);
PrecacheModel(::modelName[1]);
Obj <-
{
	//-------------------------------------------------------
	// Required Interface functions
	//-------------------------------------------------------
	function GetPrecacheList()
	{
		local precacheModels =
		[
			EntityGroup.SpawnTables.car,
			EntityGroup.SpawnTables.glass,
		]
		return precacheModels
	}

	//-------------------------------------------------------
	function GetSpawnList()
	{
		local spawnEnts =
		[
			EntityGroup.SpawnTables.car,
			EntityGroup.SpawnTables.glass,
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
			car = 
			{
				SpawnInfo =
				{
					classname = "prop_physics"
					model = ::modelName[0]
					targetname = "manacat_car"
					origin = Vector( 0, 0, 0 )
					angles = Vector( 0, 0, 0 )
					skin = "0"
					solid = "6"
					spawnflags = "256"
					rendercolor = ::modelName[2]
					rendermode = "0"
				}
			}
			glass =
			{
				SpawnInfo =
				{
					classname = "prop_dynamic"
					model = ::modelName[1]
					targetname = "manacat_car_glass"
					parentname = "manacat_car"
					origin = Vector( 0, 0, 0 )
					angles = Vector( 0, 0, 0 )
					skin = "0"
					solid = "6"
					spawnflags = "0"
				}
			}
		} // SpawnTables
	} // EntityGroup
}

RegisterEntityGroup( "Obj", Obj )