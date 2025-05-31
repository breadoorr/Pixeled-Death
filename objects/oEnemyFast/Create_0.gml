state = "patrol"; // Current state: "patrol" or "chase"
patrol_speed = 1; // Speed when patrolling

sp = 1;

chase_speed = 2;  // Speed when chasing
chase_range = 50;
stop_distance = 5;// Distance to detect player


path_start(path_enemy_patrol, patrol_speed, path_action_restart, false);

show_debug_message(object_index)

hp = 10