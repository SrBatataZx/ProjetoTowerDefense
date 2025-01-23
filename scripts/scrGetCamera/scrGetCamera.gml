// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
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
//função para criar objetos no meio da tela e em layer especifico
function criar_ui_menus(objeto, _x, _y){
	var _dados_camera = dados_camera();
	var center_x = _dados_camera.center_x
	var center_y = _dados_camera.center_y
	if(!instance_exists(objeto)){
		instance_create_layer(center_x + _x, center_y + _y, "ui", objeto);
	}
}
function criar_objeto(_se_OBJ_ext, _layer ,_objeto){
	if(object_exists(_se_OBJ_ext) /*&& !object_exists(oCamera)*/){
		instance_create_layer(x,y,_layer,_objeto)
	}
}
function destruir_ui(_UI){
	instance_deactivate_layer(_UI)
}