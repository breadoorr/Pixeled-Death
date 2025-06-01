// Таймер для анимации
timer += delta_time / 1000000;

// Постепенный вывод текста
if (timer >= text_speed && current_char < string_length(full_text)) {
    display_text += string_char_at(full_text, current_char + 1);
    current_char++;
    timer = 0;
}

// Переход к следующей реплике по нажатию пробела
if (keyboard_check_pressed(vk_space)) {
    if (current_char >= string_length(full_text)) {
        current_line++;
        start_next_line();
    } else {
        // Пропустить анимацию - показать весь текст сразу
        display_text = full_text;
        current_char = string_length(full_text);
    }
}

switch (global.dialogue_ind){
	case 1:
		dialogues = [
		    ["Mage", ["TEST?"]],
		    ["DEATH", ["TEST."]],
		]
		break;
}