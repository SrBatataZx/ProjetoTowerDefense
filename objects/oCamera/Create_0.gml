/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
alvo = noone;
estado = noone;

#region aplicando zoom
//escala = 1;
//cam_w = camera_get_view_width(view_camera[0]);
//cam_h = camera_get_view_height(view_camera[0]);

//zoom = function(){
//	camera_set_view_size(view_camera[0], cam_w * escala, cam_h * escala);
//	if(mouse_wheel_down()){
//		escala += .1;
//	} else if(mouse_wheel_up()){
//		escala -= .1
//	}
//}
#endregion

segue_alvo = function(){
	var _view_w = camera_get_view_width(view_camera[0])
	var _view_h = camera_get_view_height(view_camera[0])
	
	var _cam_x = x - _view_w / 2;
	var _cam_y = y - _view_h / 2;
	
	_cam_x = clamp(_cam_x, 0, room_width - _view_w);
	_cam_y = clamp(_cam_y, 0, room_height - _view_h);
	
	x = lerp(x, alvo.x, .1)
	y = lerp(y, alvo.y, .1)
	camera_set_view_pos(view_camera[0], _cam_x, _cam_y);
};
//segue_alvo = function(){
//	var _view_w = camera_get_view_width(view_camera[0]);
//	var _view_h = camera_get_view_height(view_camera[0]);

//	// Crie variáveis estáticas para manter a posição suavizada da câmera
//	static cam_x = 0;
//	static cam_y = 0;

//	// Destino ideal da câmera (centralizado no alvo)
//	var target_x = alvo.x - _view_w / 2;
//	var target_y = alvo.y - _view_h / 2;

//	// Suavização com lerp
//	cam_x = lerp(cam_x, target_x, 0.1);
//	cam_y = lerp(cam_y, target_y, 0.1);

//	// Impede que a câmera ultrapasse os limites da sala
//	cam_x = clamp(cam_x, 0, room_width - _view_w);
//	cam_y = clamp(cam_y, 0, room_height - _view_h);

//	// Atualiza a posição da câmera
//	camera_set_view_pos(view_camera[0], cam_x, cam_y);
//};
segue_player = function(){
	if(instance_exists(oPlayer)){
		alvo = oPlayer;
	} else {
		estado = segue_nada;
	}
	segue_alvo()
	if(instance_exists(oEstrutura)){
		if(oEstrutura.vida > 0){
			if(global.pause = false){
				if (keyboard_check_released(vk_space)) estado = segue_casa;
			}
		}
	}
}
segue_casa = function(){
	if(instance_exists(oEstrutura)){
		alvo = oEstrutura;
	} else {
		estado = segue_nada;
	}
	segue_alvo()
	if(oEstrutura.vida > 0){
		if(global.pause = false){
			if (keyboard_check_released(vk_space)) estado = segue_player;
		}
	}
}
segue_nada = function(){
	alvo = noone;
}

estado = segue_player;