switch (global.dialogue_ind){
	case 0:
		dialogues = [
		    ["Mage", ["What... Where am I?"]],
		    ["???", ["I haven't the faintest idea either."]],
			//["Mage", ["WHOA, WHAT THE HELL?!"]],
			//["???", ["Quiet now, calm down. I don't understand any of this either."]],
			//["???", ["It seems... I've accidentally ended up in your body... And... can't get out?"]],
			//["Mage", ["Who even are you? What are you?"]],
			//["Death", ["Death"]],
			//["Mage", ["..."]],
			//["Death", ["..."]],
			//["Mage", ["Okay? And what do you want?"]],
			//["Death", ["To leave. But I can't."]],
			//["Mage", ["Why?"]],
			//["Death", ["Something's binding me to you. Something in this castle..."]],
			//["Mage", ["So what are you suggesting?"]],
			//["Death", ["Help me."]],
			//["Death", ["Free me from these shackles. I don't want to be stuck here with you."]],
			//["Mage", ["But... what's in it for me except not having to look at your ugly mug?.."]],
			//["Death", ["Well. You'll stay alive."]],
			//["Mage", ["That's... a compelling argument."]],
			//["Death", ["Don't worry, I'll aid you on your journey. Some of my power still remains..."]],
			//["Mage", ["Well then, shall we go?"]],
		];
		break;
		
	case 1:
		dialogues = [
		    ["Mage", ["TEST?"]],
		    ["DEATH", ["TEST."]],
		]
		break;
}

// Текущие индексы
current_speaker = 0;
current_line = 0;
current_char = 0;

// Настройки вывода
text_speed = 0.05; // сек между символами
timer = 0;
full_text = "";
display_text = "";

depth=-100

start_next_line(); 