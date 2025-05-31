// Check if player exists

if (hp <= 0) {
    state = "dead";
    speed = 0; // Stop movement
    path_end(); // Stop path
    //death_timer = death_duration; // Start death timer
    // Optional: Play death animation or effect
    // sprite_index = spr_enemy_death; // Uncomment if you have a death sprite
    // audio_play_sound(snd_enemy_die, 10, false); // Uncomment if you have a sound
    instance_destroy();
	exit; // Skip other logic
}

if (instance_exists(oPlayer)) {
    var dist_to_player = point_distance(x, y, oPlayer.x, oPlayer.y);
    
    // State machine
    switch (state) {
        case "patrol":
            // Check if player is in range
            if (dist_to_player < chase_range) {
                state = "chase";
                path_end(); // Stop the path when chasing
            }
            // Face the direction of movement (optional)
            if (path_speed != 0) {
                image_angle = point_direction(xprevious, yprevious, x, y);
            }
            break;
            
        case "chase":
            // Check if player is out of chase range
            if (dist_to_player > chase_range) {
                // Return to patrolling
                state = "patrol";
                path_start(path_enemy_patrol, patrol_speed, path_action_restart, false);
            } else {
                // Face the player
                //image_angle = point_direction(x, y, oPlayer.x, oPlayer.y);
                
                // Move toward the player only if farther than stop_distance
                if (dist_to_player > stop_distance) {
                    move_towards_point(oPlayer.x, oPlayer.y, chase_speed);
                } else {
                    speed = 0; // Stop moving if too close
                }
            }
            break;
    }
} else {
    // If no player, stay in patrol state
    if (state != "patrol") {
        state = "patrol";
        path_start(path_enemy_patrol, patrol_speed, path_action_restart, false);
    }
}