::caralarmRNG <- function()
{
	local r = RandomInt(1,2);
	if(r == 1)	return "vehicles/car_alarm/car_alarm2.wav"
	else if(r == 2)	return "vehicles/car_alarm/car_alarm.wav"
}