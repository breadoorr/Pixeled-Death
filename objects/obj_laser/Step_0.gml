x = oPlayer.x;
y = oPlayer.y;

direction = point_direction(x, y, mouse_x, mouse_y);
image_angle = direction;

var kb_dir = point_direction(x, y, mouse_x, mouse_y);
var kb_spd = 1;

var hit_x = x;
var hit_y = y;
var step = 1;


var len = point_distance(x, y, mouse_x, mouse_y);
var dist = len;

var wall_check = collision_line(x, y, mouse_x, mouse_y, tilemap, false, false)

if(wall_check != noone){
dist = 1;
 repeat (len div step){
	hit_x = x + lengthdir_x(dist, direction);
    hit_y = y + lengthdir_y(dist, direction);
	
	 if (collision_point(hit_x, hit_y, tilemap, true, true)) {
        break;}
		dist += step;
		image_xscale = dist;
		 
 }
}else{image_xscale = len;}






//var las_target = collision_line(x, y, mouse_x, mouse_y, Obj_target, true, false);
//if(las_target !=noone){
	
//	las_target.kb_spd = kb_spd;
//	las_target.kb_dir = kb_dir;
	
//	if(las_target.dmg_cldwn <= 0){
//		las_target.hp -= 0.2;
//		las_target.dmg_cldwn = 10;

//		if (las_target.hp <= 0){
//			instance_destroy(las_target);
//		}
//		}else{las_target.image_blend = c_red;}
			

//}

with (Obj_target) {
    var dist_to_self = point_distance(other.x, other.y, x, y);
    var dir_to_self = point_direction(other.x, other.y, x, y);
    
    // Якщо цей ворог на шляху променя і в межах довжини
    if (abs(angle_difference(dir_to_self, other.direction)) < 5 && dist_to_self <= dist) {
        
        if (dmg_cldwn <= 0) {
            hp -= 0.2;
            dmg_cldwn = 10;
            
            if (hp <= 0) {
                instance_destroy();
            }
        } else {
            image_blend = c_red;
        }
        
        kb_spd = 1;
        kb_dir = other.direction;
    }
}







