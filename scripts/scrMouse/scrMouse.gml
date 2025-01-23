// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
//#region dados do mouse e camera, para puxar direto em outro codigo
function checar_mouse(){
	mouse_poss(sndwoodblock);
	detecta_mouse();
	checa_click();
}
function detecta_mouse(){
	if(position_meeting(mouse_x,mouse_y,self)){
		image_index = 1
		image_angle = 4
		image_alpha = 1
	} else {
		image_index = 0
		image_angle = 0
		image_alpha = 0.8
	}
}
//function detecta_mouse(_img_ind_inside,_img_ang_inside,_img_alp_inside,_img_ind_out,_img_ang_out,_img_alp_out){
//	if(position_meeting(mouse_x,mouse_y,self)){
//		image_index = _img_ind_inside
//		image_angle = _img_ang_inside
//		image_alpha = _img_alp_inside
//	} else {
//		image_index = _img_ind_inside
//		image_angle = _img_ang_inside
//		image_alpha = _img_alp_inside
//	}
//}
function mouse_poss(_som){
	// Verifique se o mouse está sobre o objeto
	//if (mouse_x >= x - sprite_width / 2 && mouse_x <= x + sprite_width / 2 && mouse_y >= y - sprite_height / 2 && mouse_y <= y + sprite_height / 2) {
	if (position_meeting(mouse_x,mouse_y,self)){
		// Verifique se é a primeira vez que o mouse entrou
		if (!mouse_entered){
			// Marcar que o mouse entrou no objeto
			mouse_entered = true;
			// Tocar o som
			audio_play_sound(_som, 1, false);
		}
	} else {
		// Se o mouse saiu, marque como false
		mouse_entered = false;
	}
}

function checa_click(){
	if(position_meeting(mouse_x,mouse_y,oIniciar)){
		if(mouse_check_button_pressed(1)){
			room_goto(rJogo)
		}
	}
	if(position_meeting(mouse_x,mouse_y,oVoltar)){
		if(mouse_check_button_pressed(1)){
			destruir_ui("ui")
			global.pause = false
		}
	}
	if(position_meeting(mouse_x,mouse_y,oSair)){
		if(mouse_check_button_pressed(1)){
			game_end()
		}
	}
}