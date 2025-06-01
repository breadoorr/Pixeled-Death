
if(alarm[3] < 0){
if mouse_check_button_pressed(mb_right)
{
	instance_create_layer(mouse_x, mouse_y, "instances", obj_aoe);
	alarm[3] = 10;
}
}