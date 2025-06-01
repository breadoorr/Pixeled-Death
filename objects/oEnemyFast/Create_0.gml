state = "patrol"; // Current state: "patrol" or "chase"
patrol_speed = 2; // Speed when patrolling

sp = 1;

chase_speed = 6;  // Speed when chasing
chase_range = 100;
//stop_distance = ;// Distance to detect player

//hp = 100;
chase_range = 350;
chase_speed = (object_index == oEnemyFast) ? 4 : 2; // Faster for oEnemyFast
patrol_speed = 2;
stop_distance = 400;
damage = 5;
dmg_cldwn = 0;
dmg_cldwn_max = 30; // Cooldown frames between damage
kb_spd = 0;
kb_dir = 0;
kb_strength = 15; // Knockback strength
init_x = x;
init_y = y;
//state = "patrol";


hp = 10


knockback_speed = 5; // Speed of knockback
knockback_duration = 10; // Frames for knockback
knockback_timer = 0;
knockback_dir = 0;


init_x = x
init_y = y

kb_spd = 0;
kb_dir = 0;
kb_x = 0;
kb_y = 0;
dmg_cldwn=0;

attack_dist = (object_index == oEnemyFast) ? 80 : 150;