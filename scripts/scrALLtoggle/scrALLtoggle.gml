// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function toggle_fullscreen(){
	switch(global.fullscreen){
		case true:
			window_set_fullscreen(false);
			global.fullscreen = false;
			
		break;
		case false:
			window_set_fullscreen(true);
			global.fullscreen = true
		break;
	}
}
function toggle_pause(){
	switch(global.pause){
		case true:
			global.pause = false
		break;
		case false:
			global.pause = true
		break;
	}
}
function toggle_debug(){
	switch(global.debug){
		case true:
			global.debug = false
		break;
		case false:
			global.debug = true
		break;
	}
}