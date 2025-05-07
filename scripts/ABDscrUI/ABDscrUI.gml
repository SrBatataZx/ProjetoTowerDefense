//// Os recursos de script mudaram para a v2.3.0; veja
//// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
//function menuDeadPause(){
//	//global.pause = true
//	criar_ui_menus(oReiniciar,0,0,"pause_morte");
//	criar_ui_menus(oConfiguracao,0,50,"pause_morte");
//	criar_ui_menus(oSair,0,100,"pause_morte");
//}

//function menuInicial(){
//	criar_ui_menus(oIniciar,-550,0,"menu");
//	criar_ui_menus(oConfiguracao,-550,50,"menu");
//	criar_ui_menus(oSair,500,300,"menu");
//}

//function menuConfiguracao(){
//	criar_ui_menus(oSom,0,0,"configuracao")
//	criar_ui_menus(oVoltar,0,100,"configuracao")
//	criar_ui_menus(oPlus,100,0,"configuracao")
//	criar_ui_menus(oMinus,-100,0,"configuracao")
//}
//function criar_ui_menus(objeto, _x, _y, _layer){
//	var _dadosCamera = dadosCamera();
//	var center_x = _dadosCamera.center_x
//	var center_y = _dadosCamera.center_y
//	if(layer_exists(_layer)){
//		if(!instance_exists(objeto)){
//			instance_create_layer(center_x + _x, center_y + _y, _layer, objeto);
//		} 
//	}
//}
////function criar_ui_menus(objeto, _x, _y, _layer){
////	var _dadosCamera = dadosCamera();
////	var center_x = _dadosCamera.center_x
////	var center_y = _dadosCamera.center_y
////	if(!instance_exists(objeto)){
////		instance_create_layer(center_x + _x,center_y + _y,_layer,objeto)
////	}
////}

//function destruir_objeto(_objeto){
//	instance_destroy(_objeto)
//}

//#region dados do mouse e camera, para puxar direto em outro codigo
//function detecta_mouse(){
//	if(position_meeting(mouse_x,mouse_y,self)){
//		image_index = 1
//		image_angle = 8
//		image_alpha = 1
//	} else {
//		image_index = 0
//		image_angle = 0
//		image_alpha = 0.80
//	}
//}
////function detecta_mouse(_img_ind_inside,_img_ang_inside,_img_alp_inside,_img_ind_out,_img_ang_out,_img_alp_out){
////	if(position_meeting(mouse_x,mouse_y,self)){
////		image_index = _img_ind_inside
////		image_angle = _img_ang_inside
////		image_alpha = _img_alp_inside
////	} else {
////		image_index = _img_ind_inside
////		image_angle = _img_ang_inside
////		image_alpha = _img_alp_inside
////	}
////}

//function checarMouse(){
//	mouse_poss(sndwoodblock)
//	if(position_meeting(mouse_x,mouse_y,oIniciar)){
//		if(mouse_check_button_pressed(1)){
//			var _room = rJogo
//			room_goto(_room)
//		}
//	}
//	if(position_meeting(mouse_x,mouse_y,oSair)){
//		if(mouse_check_button_pressed(1)){
//			game_end()
//		}
//	}
//	if(position_meeting(mouse_x,mouse_y,oReiniciar)){
//		if(mouse_check_button_pressed(1)){
//			room_restart()
//			global.pause = false
//		}
//	}
//	if(position_meeting(mouse_x,mouse_y,oConfiguracao)){
//		if(mouse_check_button_pressed(1)){
//			instance_deactivate_layer("menu");
//			menuConfiguracao()
//			//var _room = rConfiguracao
//			//room_goto(_room)
//		}
//	}
//	if(position_meeting(mouse_x,mouse_y,oVoltar)){
//		if(mouse_check_button_pressed(1)){
//			instance_deactivate_layer("configuracao");
//			menuInicial()
//			//var _room = rConfiguracao
//			//room_previous()
//		}
//	}
//}

//function mouse_poss(_som){
//	// Verifique se o mouse está sobre o objeto
//	if (mouse_x >= x - sprite_width / 2 && mouse_x <= x + sprite_width / 2 && mouse_y >= y - sprite_height / 2 && mouse_y <= y + sprite_height / 2) {
//		// Verifique se é a primeira vez que o mouse entrou
//		if (!mouse_entered) {
//			// Marcar que o mouse entrou no objeto
//			mouse_entered = true;
//			// Tocar o som
//			audio_play_sound(_som, 1, false);
//		}
//	} else {
//		// Se o mouse saiu, marque como false
//		mouse_entered = false;
//	}
//}

//function dadosCamera(){
//	var _cam = view_camera[0]
//	// Obter as coordenadas da câmera
//	var cam_x = camera_get_view_x(_cam);
//	var cam_y = camera_get_view_y(_cam);
//	// Obter o tamanho da visão da câmera
//	var cam_width = camera_get_view_width(_cam);
//	var cam_height = camera_get_view_height(_cam);
//	// Calcular o centro da câmera
//	var center_x = cam_x + cam_width / 2;
//	var center_y = cam_y + cam_height / 2;
	
//	return {
//		"x": cam_x,
//		"y": cam_y,
//		"width": cam_width,
//		"height": cam_height,
//		"center_x": center_x,
//		"center_y": center_y
//	};
//}
//#endregion