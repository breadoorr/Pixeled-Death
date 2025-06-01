function start_next_line() {
    // Проверяем выход за границы
    if (current_speaker >= array_length(dialogues)) {
        // Диалоги закончились
        full_text = "[END]";
		global.dialogue_ind += 1 ;
        display_text = "";
		room_goto(Room1)
		instance_destroy(oTextOutput)
        return;
    }
    
    // Получаем текущего спикера и его реплики
    var speaker_data = dialogues[current_speaker];
    var lines = speaker_data[1];
    
    if (current_line >= array_length(lines)) {
        // Переключаем на следующего спикера
        current_speaker++;
        current_line = 0;
        start_next_line(); // Рекурсивный вызов
        return;
    }
    
    // Устанавливаем новый текст
    full_text = lines[current_line];
    display_text = "";
    current_char = 0;
    timer = 0;
}