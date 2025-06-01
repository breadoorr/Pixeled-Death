if (alarm[1] < 0)
{
	hp -=other.damage;
	image_blend = c_red;
	alarm[1] = 40;
}
	kb_spd = other.kb_spd;
	kb_dir =  point_direction(other.x, other.y, x, y);