switch (global.cutscene_id) {
	case 7: // Scene: Shadows & Sunlight
	   if (fade_alpha > 0) fade_alpha -= 0.02;
       
        if (dialogue_visible) {
            typewriter_counter += 1;
                if (typewriter_counter >= typewriter_speed) {
                    typewriter_counter = 0;
                    if (typewriter_index < string_length(current_dialogue)) {
                        typewriter_index += 1;
                        displayed_text = string_copy(current_dialogue, 1, typewriter_index);
                    }
                }            
        } else {
            typewriter_index = 0;
            displayed_text = "";
        }
        
        
	    switch (cutscene_step) {
	        case 0:
	            if (!dialogue_visible) {
	                dialogue_speaker = "Narration";
	                current_dialogue = "The hallway buzzes like usual, shoes squeaking, lockers clanging, someone laughing too loud about nothing.";
	                dialogue_visible = true;
	            } 
	            else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
	                room_goto(school_day3_scene1_1);
					dialogue_visible = false;
	                cutscene_step = 1;
	            }
	            break;

	        case 1:
	            if (!dialogue_visible) {
	                dialogue_speaker = "Narration";
	                current_dialogue = "You reach the classroom before the bell. Casey’s already there, flipping through a notebook. She glances up when you walk in.";
	                dialogue_visible = true;
	            } 
	            else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
	                dialogue_visible = false;
	                cutscene_step = 2;
	            }
	            break;

	        case 2:
	            if (!dialogue_visible) {
	                dialogue_speaker = "Casey";
	                current_dialogue = "You look… kinda less haunted today. That progress?";
	                dialogue_visible = true;
	            } 
	            else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
	                dialogue_visible = false;
	                cutscene_step = 3;
	            }
	            break;

	        case 3:
	            if (!dialogue_visible) {
	                dialogue_speaker = "You";
	                current_dialogue = "Maybe. I slept. That’s something.";
	                dialogue_visible = true;
	            } 
	            else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
	                dialogue_visible = false;
	                cutscene_step = 4;
	            }
	            break;

	        case 4:
	            if (!dialogue_visible) {
	                dialogue_speaker = "Casey";
	                current_dialogue = "That is something. You don’t have to tell me stuff, but… if you ever feel like it, I’m not terrible at listening.";
	                dialogue_visible = true;
	            } 
	            else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
	                dialogue_visible = false;
	                cutscene_step = 5;
	            }
	            break;

	        case 5:
	            if (!dialogue_visible) {
	                dialogue_speaker = "Narration";
	                current_dialogue = "You hesitate. Then sit down beside her, feeling the weight of the offer, but also the comfort in it.";
	                dialogue_visible = true;
	            } 
	            else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
	                dialogue_visible = false;
	                choice_made = false;
	                cutscene_step = 6;
	            }
	            break;

	        case 6:
	            if (!choice_made && !choice_active) {
	                choice_options = [
	                    "There’s stuff going on, yeah. Hard to explain.",
	                    "It’s just… Been tense at home. Like walking on glass.",
	                    "I’m fine. Just tired, that’s all."
	                ];
	                choice_selected = 0;
	                choice_active = true;
	            } 
	            else if (choice_active) {
	                if (keyboard_check_pressed(vk_down)) {
	                    choice_selected = (choice_selected + 1) % array_length(choice_options);
	                }
	                if (keyboard_check_pressed(vk_up)) {
	                    choice_selected = (choice_selected - 1 + array_length(choice_options)) % array_length(choice_options);
	                }
	                if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
	                    choice_made = true;
	                    choice_active = false;

	                    dialogue_speaker = "You";
	                    current_dialogue = choice_options[choice_selected];
	                    dialogue_visible = true;

	                    if (choice_selected == 0) player_mood += 1;
	                    else if (choice_selected == 1) player_mood += 2;
	                    else if (choice_selected == 2) player_mood -= 1;

	                    global.player_mood = player_mood;

	                    cutscene_step = 6.5;
	                }
	            }
	            break;

	        case 6.5:
	            if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
	                dialogue_visible = false;
	                cutscene_step = 7;
	            }
	            break;

	        case 7:
	            if (!dialogue_visible) {
	                dialogue_speaker = "Casey";
	                current_dialogue = "Well… just know I’ve got snacks and sarcasm if you need either.";
	                dialogue_visible = true;
	            } 
	            else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
	                dialogue_visible = false;
	                cutscene_step = 8;
	            }
	            break;

	        case 8:
	            if (!dialogue_visible) {
	                dialogue_speaker = "Narration";
	                current_dialogue = "She smiles again, and for a moment, it feels easier to smile back.";
	                dialogue_visible = true;
	            } 
	            else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
	                dialogue_visible = false;
	                cutscene_step = 9;
	            }
	            break;
	            
	            case 9:
                    if (!dialogue_visible) {
                        global.cutscene_id = 8;
                        global.cutscene_active = true;
                        room_goto(school_day3_scene2); // move to next room/scene
                    }
                    break;
	    }
	    break;
}