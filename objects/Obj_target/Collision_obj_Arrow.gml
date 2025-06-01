instance_destroy(other);
if (alarm[2] < 0)
{
	hp -=other.damage;
	image_blend = c_red;
	alarm[2] = 20;
}
	kb_spd = other.kb_spd;
	kb_dir = other.kb_dir;