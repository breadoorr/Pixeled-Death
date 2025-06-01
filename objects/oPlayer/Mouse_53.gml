if(alarm[1] < 0){
if mouse_check_button_pressed(mb_left)
{
	instance_create_layer(x, y, "Instances", obj_Arrow);
	alarm[1] = 20;
}
}