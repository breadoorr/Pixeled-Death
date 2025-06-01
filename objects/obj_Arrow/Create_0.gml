speed = 20;
direction = point_direction(x, y, mouse_x, mouse_y);
image_angle = direction-90;
damage = 1;


with(other){
	kb_dir = point_direction(x, y, mouse_x, mouse_y);
    kb_spd = 6;
}