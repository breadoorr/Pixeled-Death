// Step Event for oEnemyFast and oEnemyTank
if (kb_spd > 0) {
    kb_x = lengthdir_x(kb_spd, kb_dir);
    kb_y = lengthdir_y(kb_spd, kb_dir);
    x += kb_x;
    y += kb_y;
    kb_spd -= 0.5;
    if (kb_spd < 0) kb_spd = 0;
}

if (dmg_cldwn > 0) {
    dmg_cldwn--;
}

// Check if enemy is dead
if (hp <= 0) {
    state = "dead";
    speed = 0;
    path_end();
    instance_destroy();
    exit;
}

// Initialize in Create Event (example, add if not present):
/*
hp = 100;
chase_range = 200;
chase_speed = (object_index == oEnemyFast) ? 4 : 2; // Faster for oEnemyFast
patrol_speed = 1;
stop_distance = 10;
damage = 5;
dmg_cldwn = 0;
dmg_cldwn_max = 30; // Cooldown frames between damage
kb_spd = 0;
kb_dir = 0;
kb_strength = 6; // Knockback strength
init_x = x;
init_y = y;
state = "patrol";
*/

// Handle knockback
if (knockback_timer > 0) {
    var _xmove = lengthdir_x(knockback_speed, knockback_dir);
    var _ymove = lengthdir_y(knockback_speed, knockback_dir);
    
    if (!place_meeting(x + _xmove, y, oWall)) {
        x += _xmove;
    }
    if (!place_meeting(x, y + _ymove, oWall)) {
        y += _ymove;
    }
    
    knockback_timer--;
    exit;
}

// Main logic
if (instance_exists(oPlayer)) {
    var dist_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
    
    switch (state) {
        case "patrol":
            if (dist_to_player < chase_range) {
                state = "chase";
            }
            break;
            
        case "chase":
            if (dist_to_player > chase_range) {
                state = "patrol";
                var dir = point_direction(x, y, init_x, init_y);
                var _xmove = lengthdir_x(patrol_speed, dir);
                var _ymove = lengthdir_y(patrol_speed, dir);
                
                if (!place_meeting(x + _xmove, y, oWall)) {
                    x += _xmove;
                }
                if (!place_meeting(x, y + _ymove, oWall)) {
                    y += _ymove;
                }
            } else {
                // Chase player
				
                var move_spd = (object_index == oEnemyTank) ? patrol_speed : chase_speed;
                var dir = point_direction(x, y, oPlayer.x, oPlayer.y);
                
                //if (dist_to_player > stop_distance) {
                    var _xmove = lengthdir_x(move_spd, dir);
                    var _ymove = lengthdir_y(move_spd, dir);
					
					if (object_index == oEnemyShoot && dist_to_player <= stop_distance) {
						_xmove = 0
						_ymove = 0
						
						if(alarm[5] < 0){ //alarm - кд

						
							instance_create_layer(x, y, "Instances", obj_enemyarrow);
	
							alarm[5] = 60; //установка кд
							}
					}

					
                    
                    if (!place_meeting(x + _xmove, y, oPlayer) && !place_meeting(x + _xmove, y, oWall)) {
                x += _xmove;
            //}
            if (!place_meeting(x, y + _ymove, oPlayer) && !place_meeting(x, y + _ymove, oWall)) {
                y += _ymove;
            }
			
			
        } else {
            // Collision with player
			if (object_index == oEnemyFast or object_index == oEnemyTank) {
            if (dist_to_player <= attack_dist && dmg_cldwn <= 0 && instance_exists(oPlayer)) {
                // Apply damage and set attacked state
                oPlayer.hp -= damage;
                oPlayer.state = "attacked";
                oPlayer.attacked_timer = oPlayer.attacked_duration;
                // Apply knockback to player
                oPlayer.kb_spd = kb_strength;
                oPlayer.kb_dir = point_direction(x, y, oPlayer.x, oPlayer.y);
                dmg_cldwn = dmg_cldwn_max;
            }
			}
        }
            }
            break;
    }
} else {
    if (state != "patrol") {
        state = "patrol";
        var dir = point_direction(x, y, init_x, init_y);
        var _xmove = lengthdir_x(patrol_speed, dir);
        var _ymove = lengthdir_y(patrol_speed, dir);
        
        if (!place_meeting(x + _xmove, y, oWall)) {
            x += _xmove;
        }
        if (!place_meeting(x, y + _ymove, oWall)) {
            y += _ymove;
        }
    }
}