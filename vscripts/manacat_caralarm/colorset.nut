::colorSet <- function()
{
	local r;
	local g;
	local b;
	local color = RandomInt(1,7);
	if(color == 1)	{ r = 239; g=155; b=155 } //R
	else if(color == 2)	{ r = 128; g=167; b=128 } //G
	else if(color == 3)	{ r = 176; g=204; b=225 } //B
	else if(color == 4)	{ r = 239; g=191; b=36 } //Y
	else				{ r = 235; g=235; b=235 } //W

	r += RandomInt(-15,15);
	g += RandomInt(-15,15);
	b += RandomInt(-15,15);

	return r+" "+g+" "+b;
}