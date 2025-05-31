xSpeed = 0;
ySpeed = 0;

if (keyboard_check(ord("W"))) {
    xSpeed += lengthdir_x(move_speed, image_angle + 90);
    ySpeed += lengthdir_y(move_speed, image_angle + 90);
	
}
if (keyboard_check(ord("S"))) {
    xSpeed += lengthdir_x(move_speed, image_angle - 90);
    ySpeed += lengthdir_y(move_speed, image_angle - 90);
}
if (keyboard_check(ord("A"))) {
    xSpeed += lengthdir_x(move_speed, image_angle + 180);
    ySpeed += lengthdir_y(move_speed, image_angle + 180);
	image_xscale = -1
}
if (keyboard_check(ord("D"))) {
    xSpeed += lengthdir_x(move_speed, image_angle);
    ySpeed += lengthdir_y(move_speed, image_angle);
	image_xscale = 1
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
        if (point_distance(x, y, other.x, other.y) < 30 && other.atk) {
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