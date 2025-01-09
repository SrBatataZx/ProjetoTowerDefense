// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
// Função para verificar teclas pressionadas e realizar as ações
function check_keypresses() {
	// Alterna o modo de debug
	if(keyboard_check_pressed(ord("L"))){
		global.debug = !global.debug;
		show_debug_info();
	}
	// Alterna o modo fullscreen
	if(keyboard_check_pressed(vk_f5)){
		toggle_fullscreen();
	}
	// Finaliza o jogo
	if(keyboard_check_pressed(vk_escape)){
		game_end();
	}
	if(keyboard_check_pressed(ord("R"))){
		game_restart()
	}
}
// Função para alternar o modo fullscreen
function toggle_fullscreen() {
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
// Função para mostrar/ocultar informações de debug
function show_debug_info() {
	switch(global.debug) {
		case true:
			show_debug_message("Modo de depuração ativado!");
		break;
		case false:
			show_debug_message("Modo de depuração desativado!");
		break;
	}
}