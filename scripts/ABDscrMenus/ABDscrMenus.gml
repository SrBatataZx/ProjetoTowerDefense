//// Os recursos de script mudaram para a v2.3.0; veja
//// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
//function deactive_layer(_layer){
//	instance_deactivate_layer(_layer)
//}
//function active_layer(_layer){
//	instance_activate_layer(_layer)
//}

//function pause_morte(){
//	criar_ui_menus(oReiniciar,0,0,"pause_morte");
//	criar_ui_menus(oConfiguracao,0,50,"pause_morte");
//	criar_ui_menus(oSair,0,100,"pause_morte");
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