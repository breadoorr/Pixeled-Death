
if (mouse_check_button_pressed(mb_right) && laser_ready)
{
	instance_create_layer(x, y, "instances", obj_laser);
	laser_ready = false;
	laser_on = true;
	alarm[4] = 180;
}
