if laser_on{
	instance_destroy(obj_laser);
	laser_on = false;
	alarm[4] = 180;}
	else{laser_ready = true;}