// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
// Função para verificar teclas pressionadas e realizar as ações
function check_keypresses(){
	// Alterna o modo de debug
	if(keyboard_check_pressed(ord("L"))){
		toggle_debug()
	}
	// Reiniciando jogo
	if(keyboard_check_pressed(ord("R"))){
		game_restart()
	}
	// Alternando pause
	if(keyboard_check_pressed(vk_escape) or keyboard_check_pressed(ord("P"))){
		toggle_pause()
	}
	// Alterna o modo fullscreen
	if(keyboard_check_pressed(vk_f11)){
		toggle_fullscreen();
	}
}