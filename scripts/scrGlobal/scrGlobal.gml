// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
// Função para verificar teclas pressionadas e realizar as ações
function check_keypresses(){
	// Verifica se a tecla "L" foi pressionada para alternar o modo de debug
	if(tecla_check("pressed",(ord("L")))){
		global.debug = !global.debug
		chama_debug("Debug", global.debug)
	}
	// Verifica se a tecla "R" foi pressionada para reiniciar o jogo
	if(tecla_check("pressed",(ord("R")))){
		game_restart()
	}
	// Verifica se a tecla "Esc" ou "P" foi pressionada para alternar o pause
	if(tecla_check("pressed",vk_escape) || tecla_check("pressed",(ord("P")))){
		global.pause = !global.pause
		switch(global.PauseMenu){
			case 1:
				DesativaLayer("ui")
				global.PauseMenu = false
			break
			case 0:
				criaMenu("Pause")
			break
		}
		chama_debug("Pause", global.pause)
	}
	// Verifica se a tecla "F11" foi pressionada para alternar o modo fullscreen
	if(tecla_check("pressed",vk_f11)){
		changeFullscreen()
	}
}
//funcao auxiliar para checar a forma que é assionada a tecla, e inclui a tecla em si na verificação.
function tecla_check(tipo,tecla){
	switch(tipo){
		case "pressed":
			return keyboard_check_pressed(tecla);
		case "released":
			return keyboard_check_released(tecla);
	}
	return false;
}
//funcao auxiliar para setar a forma da tela
function changeFullscreen(){
	global.fullscreen = !global.fullscreen
	window_set_fullscreen(global.fullscreen)
	salvarConfig("FullScreen", global.fullscreen);
	chama_debug("FullScreen", window_get_fullscreen())
}