// Reset movement
xSpeed = 0;
ySpeed = 0;



// Handle keyboard input for movement relative to image_angle
if (keyboard_check(vk_up)) {
    // Move forward (in the direction of image_angle)
    xSpeed += lengthdir_x(move_speed, image_angle + 90);
    ySpeed += lengthdir_y(move_speed, image_angle + 90);
}
if (keyboard_check(vk_down)) {
    // Move backward (opposite to image_angle)
    xSpeed += lengthdir_x(move_speed, image_angle - 90);
    ySpeed += lengthdir_y(move_speed, image_angle - 90);
}
if (keyboard_check(vk_left)) {
    // Move left (perpendicular to image_angle)
    xSpeed += lengthdir_x(move_speed, image_angle + 180);
    ySpeed += lengthdir_y(move_speed, image_angle + 180);
}
if (keyboard_check(vk_right)) {
    // Move right (opposite to left)
    xSpeed += lengthdir_x(move_speed, image_angle);
    ySpeed += lengthdir_y(move_speed, image_angle);
}

// Toggle invincibility
if (keyboard_check_pressed(vk_control)) {
    inv = !inv;
}

// Handle attack
if (mouse_check_button_pressed(mb_left)) {
    atk = true;
}
if (mouse_check_button_released(mb_left)) {
    atk = false;
}

// Rotate sprite to face mouse
var dist_to_mouse = point_distance(x, y, mouse_x, mouse_y);
if (dist_to_mouse <= 2) {
	xSpeed = 0
	ySpeed = 0
} else {
	image_angle = point_direction(x, y, mouse_x, mouse_y) - 90;

}
// Attack enemies in range
if (instance_exists(oEnemy)) {
    with (oEnemy) {
        if (point_distance(x, y, other.x, other.y) < 30 && other.atk) {
            hp -= 5;
        }
    }
}

// Apply movement
if (!inv) {
    move_and_collide(xSpeed, ySpeed, oWall);
} else {
    x += xSpeed;
    y += ySpeed;
}


pressed_buttons = "";
if (keyboard_check(vk_up)) pressed_buttons += "Up, ";
if (keyboard_check(vk_down)) pressed_buttons += "Down, ";
if (keyboard_check(vk_left)) pressed_buttons += "Left, ";
if (keyboard_check(vk_right)) pressed_buttons += "Right, ";
if (keyboard_check(vk_control)) pressed_buttons += "Control, ";
if (mouse_check_button(mb_left)) pressed_buttons += "Left Mouse, ";

// Remove trailing comma and space if any
if (pressed_buttons != "") {
    pressed_buttons = string_copy(pressed_buttons, 1, string_length(pressed_buttons) - 2);
} else {
    pressed_buttons = "";
}