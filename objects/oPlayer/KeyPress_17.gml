if(alarm[2] < 0){
if keyboard_check(vk_control)
{
	instance_create_layer(x, y, "Instances", obj_wave);
	alarm[2] = 120;
}
}