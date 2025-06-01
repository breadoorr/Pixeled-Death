
// Отрисовка текущего диалога
if (current_speaker < array_length(dialogues)) {
    var speaker_name = dialogues[current_speaker][0];
		switch (speaker_name){
		case "Mage":
			draw_sprite(spr_player,0,x+32,y)
			break;
	
		case "Death":
			draw_sprite(spr_death,0,x+32,y)
			break;
	}
	draw_self()
	draw_text(x+10, y+10,speaker_name);
    draw_text(x+10, y+30,display_text);
	


} else {
    draw_text(20, 100, display_text); // Вывод "[КОНЕЦ ДИАЛОГА]"
}

	
	
// Подсказка для продолжения
if (current_char >= string_length(full_text) && current_speaker < array_length(dialogues)) {
    draw_text(x+(sprite_width-70), y+(sprite_height-30), "[SPACE]");
} 