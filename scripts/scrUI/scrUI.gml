// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function game_over(){
	criar_ui_reiniciar(oReiniciar,0,0);
	criar_ui_reiniciar(oSair,0,50);
}
function menu_inicial(){
	criar_ui_menuinicial(oIniciar,-550,0)
	criar_ui_menuinicial(oConfiguracao,-550,60)
	criar_ui_reiniciar(oSair,550,330);
}
function menu_pause(){
	criar_ui_menuinicial(oConfiguracao,0,0)
	criar_ui_reiniciar(oSair,0,60);
}
function criar_ui_reiniciar(objeto, _x, _y){
	var _dados_camera = dados_camera();
	var center_x = _dados_camera.center_x
	var center_y = _dados_camera.center_y
	if(!instance_exists(objeto)){
		instance_create_layer(center_x + _x,center_y + _y,"ui",objeto)
	}
}
function criar_ui_menuinicial(objeto, _x, _y){
	var _dados_camera = dados_camera();
	var center_x = _dados_camera.center_x
	var center_y = _dados_camera.center_y
	if(!instance_exists(objeto)){
		instance_create_layer(center_x + _x,center_y + _y,"ui",objeto)
	}
}

#region dados do mouse e camera, para puxar direto em outro codigo
function detecta_mouse(){
	if(position_meeting(mouse_x,mouse_y,self)){
		image_index = 1
		image_angle = 8
		image_alpha = 1
	} else {
		image_index = 0
		image_angle = 0
		image_alpha = 0.80
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

function checar_mouse(){
	mouse_poss(sndwoodblock)
	if(position_meeting(mouse_x,mouse_y,oIniciar)){
		if(mouse_check_button_pressed(1)){
			var _room = rJogo
			room_goto(_room)
		}
	}
	if(position_meeting(mouse_x,mouse_y,oSair)){
		if(mouse_check_button_pressed(1)){
			game_end()
		}
	}
	if(position_meeting(mouse_x,mouse_y,oReiniciar)){
		if(mouse_check_button_pressed(1)){
			room_restart()
			global.pause = false
		}
	}
}

function mouse_poss(_som){
	// Verifique se o mouse está sobre o objeto
	if (mouse_x >= x - sprite_width / 2 && mouse_x <= x + sprite_width / 2 && mouse_y >= y - sprite_height / 2 && mouse_y <= y + sprite_height / 2) {
		// Verifique se é a primeira vez que o mouse entrou
		if (!mouse_entered) {
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

function dados_camera(){
	var _cam = view_camera[0]
	// Obter as coordenadas da câmera
	var cam_x = camera_get_view_x(_cam);
	var cam_y = camera_get_view_y(_cam);
	// Obter o tamanho da visão da câmera
	var cam_width = camera_get_view_width(_cam);
	var cam_height = camera_get_view_height(_cam);
	// Calcular o centro da câmera
	var center_x = cam_x + cam_width / 2;
	var center_y = cam_y + cam_height / 2;
	
	return {
		"x": cam_x,
		"y": cam_y,
		"width": cam_width,
		"height": cam_height,
		"center_x": center_x,
		"center_y": center_y
	};
}
#endregion