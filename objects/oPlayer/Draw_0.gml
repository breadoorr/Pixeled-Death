// Draw the sprite
draw_self();

// Draw debug text if enabled
    draw_set_color(c_white); // Text color
    draw_set_font(-1); // Default font (set a font asset if needed)
    draw_set_halign(fa_left); // Align text left
    draw_set_valign(fa_top); // Align text top

    var xx = 10; // X position on screen
    var yy = 10; // Y position on screen
    var line_height = 20; // Spacing between lines

    // Player info
    //draw_text(xx, yy, "Player X: " + string(x));
    //draw_text(xx, yy + line_height, "Player Y: " + string(y));
    //draw_text(xx, yy + line_height * 2, "xSpeed: " + string(xSpeed));
    //draw_text(xx, yy + line_height * 3, "ySpeed: " + string(ySpeed));
    //draw_text(xx, yy + line_height * 4, "image_angle: " + string(image_angle));
    //draw_text(xx, yy + line_height * 5, "Invincible: " + string(inv));
    //draw_text(xx, yy + line_height * 6, "Attacking: " + string(atk));
    draw_text(xx, yy, "Pressed Buttons: " + pressed_buttons);

    // Nearest enemy info
    //if (instance_exists(oEnemy)) {
    //    var nearest_enemy = instance_nearest(x, y, oEnemy);
    //    draw_text(xx, yy + line_height * 2, "Enemy HP: " + string(nearest_enemy.hp));
    //    draw_text(xx, yy + line_height * 3, "Enemy State: " + nearest_enemy.state);
    //    draw_text(xx, yy + line_height * 5, "Distance to Enemy: " + string(point_distance(x, y, nearest_enemy.x, nearest_enemy.y)));
    //} else {
    //    draw_text(xx, yy + line_height * 8, "Enemy HP: None");
    //    draw_text(xx, yy + line_height * 9, "Enemy State: None");
    //    draw_text(xx, yy + line_height * 10, "Distance to Enemy: None");
    //}