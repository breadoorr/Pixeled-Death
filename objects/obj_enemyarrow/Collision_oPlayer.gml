
oPlayer.hp -= 10
oPlayer.state = "attacked";
oPlayer.attacked_timer = oPlayer.attacked_duration;
// Apply knockback to player
oPlayer.kb_spd = 10;
oPlayer.kb_dir = point_direction(x, y, oPlayer.x, oPlayer.y);
//dmg_cldwn = dmg_cldwn_max;


instance_destroy();