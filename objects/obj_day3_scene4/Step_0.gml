switch (global.cutscene_id) {
    case 9: // Scene: Evening Echoes
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
                 if (fade_alpha > 0) fade_alpha -= 0.02;
                if (!dialogue_visible) {
                    dialogue_speaker = "Narration";
                    current_dialogue = "Your dad is in the living room, flipping through a book with a tired focus. Your mom is on the couch, lost in thought. You close the door behind you gently, and they both look up.";
                    dialogue_visible = true;
                } 
                else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
                    dialogue_visible = false;
                    cutscene_step = 1;
                }
                break;
        
            case 1:
                if (!dialogue_visible) {
                    dialogue_speaker = "Mom";
                    current_dialogue = "Hey. You’re home a little later today.";
                    dialogue_visible = true;
                } 
                else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
					dialogue_visible = false;
                    cutscene_step = 2;
                }
                break;
        
            case 2:
                if (!dialogue_visible) {
                    dialogue_speaker = "Dad";
                    current_dialogue = "Everything alright?";
                    dialogue_visible = true;
                } 
                else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
					dialogue_visible = false;
                    cutscene_step = 3;
                }
                break;
        
            case 3:
                if (!dialogue_visible) {
                    dialogue_speaker = "Narration";
                    current_dialogue = "You hesitate. Then take off your shoes. Drop your bag and step further into the room.";
                    dialogue_visible = true;
                } 
                else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
					dialogue_visible = false;
                    cutscene_step = 4;
                }
                break;
        
            case 4:

                if (!dialogue_visible) {
                    dialogue_speaker = "You";
                    current_dialogue = "Yeah. Just… stayed behind to talk to someone.";
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
                    current_dialogue = "Your mom shifts in her seat. You notice the flicker in her eyes, concern, maybe, or relief.";
                    dialogue_visible = true;
                } 
                else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
					dialogue_visible = false;
                    cutscene_step = 6;
                }
                break;
				
        
            case 6:
                if (!dialogue_visible) {
                    dialogue_speaker = "Mom";
                    current_dialogue = "That’s good. Talking, I mean.";
                    dialogue_visible = true;
                } 
                else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
					dialogue_visible = false;
                    cutscene_step = 7;
                }
                break;
				
			case 7:
                if (!dialogue_visible) {
                    dialogue_speaker = "Dad";
                    current_dialogue = "We’ve noticed you’ve been… quiet lately. We didn’t want to push. But we’re here. If you ever want to talk.";
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
                    current_dialogue = "You sit at the edge of the armrest across from them. The warmth of the lamp in the corner wraps around the room like a soft blanket.";
                    dialogue_visible = true;
                } 
                else if (keyboard_check_pressed(vk_space) && typewriter_index >= string_length(current_dialogue)) {
					dialogue_visible = false;
                    cutscene_step = 9;
                }
                break;
        
            case 9:
                if (!dialogue_visible) {
			    if (global.player_mood >= 5) {
			        global.cutscene_id = 100; // Good Ending
			    } else {
			        global.cutscene_id = 200; // Bad Ending
			    }
				
				global.cutscene_active = true;
			    room_goto(ending);
                }
                break;
        	}
        	break;
        }
