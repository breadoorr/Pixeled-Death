if (keyboard_check_pressed(vk_enter)) {
	room_goto(Room2)
}

draw_set_color(c_white)
draw_text(800, 500, "Press Enter to exit")