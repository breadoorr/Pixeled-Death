// Check if player exists

if (hp <= 0) {
    state = "dead";
    speed = 0;
    path_end();
    //death_timer = death_duration; // Start death timer
    // Optional: Play death animation or effect
    // sprite_index = spr_enemy_death; // Uncomment if you have a death sprite
    // audio_play_sound(snd_enemy_die, 10, false); // Uncomment if you have a sound
    instance_destroy();
	exit;
}


if (instance_exists(oPlayer)) {
    var dist_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
    switch (state) {
        case "patrol":
            if (dist_to_player < chase_range) {
                state = "chase";
                path_end();
			}
			
			show_debug_message(self.hspeed)
            
            break;
            
        case "chase":
            if (dist_to_player > chase_range) {
                state = "patrol";
                path_start(path_enemy_patrol, patrol_speed, path_action_restart, false);
            } else {
                if (dist_to_player > stop_distance) {
					if (object_index == oEnemyTank) {
						move_towards_point(oPlayer.x, oPlayer.y, oEnemyFast.patrol_speed);
					} else if (object_index == oEnemyFast) {
						move_towards_point(oPlayer.x, oPlayer.y, chase_speed);
					} else {
						speed = 0
					}
                } else {
                    with oPlayer {
						oPlayer.hp -= 5
					}
                }
            }
            break;
    }
} else {
    if (state != "patrol") {
        state = "patrol";
        path_start(path_enemy_patrol, patrol_speed, path_action_restart, false);
    }
}