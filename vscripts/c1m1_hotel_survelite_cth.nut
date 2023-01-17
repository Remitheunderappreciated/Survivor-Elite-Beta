Convars.SetValue("sv_consistency", 0);
Convars.SetValue("sv_pure_kick_clients", 0);

::DirectorOptions <-
{
	ZombieTankHealth = 8000
}

CustomTankHealth <-
{
	function OnGameEvent_tank_spawn( params )
	{
		Ent(params.tankid).SetHealth(8000)
	}
}

__CollectEventCallbacks(CustomTankHealth, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);