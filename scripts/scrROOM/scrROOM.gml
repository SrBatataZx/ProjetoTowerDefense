// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function seleciona_room(_room_pick){
	if(_room_pick == rJogo){
		if(room == _room_pick){
			check_keypresses();
			if(global.pause == true){
				criar_ui_menus(oMenuPause,0,0)
			} else {
				destruir_ui("ui")
			}
		}
	}
	if(_room_pick == rMenu){
		if(room == _room_pick){
			if(!instance_exists(oMenuInicio)){
				criar_ui_menus(oMenuInicio,0,0)
			}
		}
	}
}