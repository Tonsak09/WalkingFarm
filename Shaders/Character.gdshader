shader_type spatial;

uniform float breakLerp; 
uniform float cellCount; 
uniform int[5] breaks; 

void vertex() 
{
	// Called for every vertex the material is visible on.
}

void fragment() 
{
	ALBEDO = vec3(floor(UV.x * cellCount) / cellCount, floor(UV.y * cellCount) / cellCount, 0);
	
	int xIndex = int(ALBEDO.x * cellCount);
	int yIndex = int(ALBEDO.y * cellCount);
	int breakLevel = int(round(breakLerp * float(breaks.length() - 1)));
	
	ALPHA = (xIndex + yIndex) % breaks[breakLevel] == 0 ? 0.0f : 1.0f;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
