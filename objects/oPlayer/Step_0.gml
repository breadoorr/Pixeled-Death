A = keyboard_check(ord("A"))
D = keyboard_check(ord("D"))
W = keyboard_check(ord("W"))
S = keyboard_check(ord("S"))



X = D-A
Y = S-W

if(X != 0 || Y != 0){
	if (!place_meeting(x + spd * X, y, oWall) && !place_meeting(x + spd * X, y, [oEnemyFast, oEnemyTank, oEnemyShoot])) {
        x += spd * X;
    }
    if (!place_meeting(x, y + spd * Y, oWall) && !place_meeting(x, y + spd * Y, [oEnemyFast, oEnemyTank, oEnemyShoot])) {
        y += spd * Y;
    }
  //x += spd * X
  //y += spd * Y
}

if (keyboard_check_pressed(vk_control)) {
    inv = !inv;
}

if (mouse_check_button_pressed(mb_left)) {
    atk = true;
}
if (mouse_check_button_released(mb_left)) {
    atk = false;
}

if (instance_exists(oEnemyFast)) {
    with (oEnemyFast) {
        if (point_distance(x, y, other.x, other.y) < 50 && other.atk) {
            hp -= 5;
        }
    }
}

if (!inv) {
    move_and_collide(xSpeed, ySpeed, oWall);
} else {
    x += xSpeed;
    y += ySpeed;
}

show_debug_message(state)

if (attacked_timer > 0) {
	image_blend = c_fuchsia;
	//kb_dir = 0;
    attacked_timer--;
    if (attacked_timer <= 0) {
        state = "normal";
    }
}

if (kb_spd > 0) {
    var _xmove = lengthdir_x(kb_spd, kb_dir);
    var _ymove = lengthdir_y(kb_spd, kb_dir);
    
    // Check collision with walls and enemies
    if (!place_meeting(x + _xmove, y, oWall) && !place_meeting(x + _xmove, y, [oEnemyFast, oEnemyTank, oEnemyShoot])) {
        x += _xmove;
    }
    if (!place_meeting(x, y + _ymove, oWall) && !place_meeting(x, y + _ymove, [oEnemyFast, oEnemyTank, oEnemyShoot])) {
        y += _ymove;
    }
    
    kb_spd -= 0.5;
    if (kb_spd < 0) kb_spd = 0;
}

if (hp <= 0) {
	room_goto(RoomDead)
}
