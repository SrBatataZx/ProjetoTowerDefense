// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
// Função para verificar teclas pressionadas e realizar as ações
function checaTeclaPressionada(){
	// Verifica se a tecla "L" foi pressionada para alternar o modo de debug
	if(tipoTecla("pressed",(ord("L")))){
		global.debug = !global.debug
		chamaDebug("Debug", global.debug)
	}
	// Verifica se a tecla "R" foi pressionada para reiniciar o jogo
	if(tipoTecla("pressed",(ord("R")))){
		game_restart()
	}
	// Verifica se a tecla "Esc" ou "P" foi pressionada para alternar o pause
	if(tipoTecla("pressed",vk_escape) || tipoTecla("pressed",(ord("P")))){
		global.pause = !global.pause
		switch(global.pauseMenu){
			case 1:
				resetGameData("paused")
			break
			case 0:
			if(room == rJogo){
				menu("criaMenu","Pause")
			} else if(room == rLobby){
				menu("criaMenu","Lobby")
			}
			break
		}
		chamaDebug("Pause", global.pause)
	}
	// Verifica se a tecla "F11" foi pressionada para alternar o modo fullscreen
	if(tipoTecla("pressed",vk_f11)){
		changeFullscreen()
	}
}
//funcao auxiliar para checar a forma que é assionada a tecla, e inclui a tecla em si na verificação.
function tipoTecla(tipo,tecla){
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
	//chamaDebug("FullScreen", window_get_fullscreen())
}

///function função auxiliar para destruir objetos
function destroyObjeto(_obj){
	instance_destroy(_obj)
}

function resetGameData(_data) {
	switch(_data){
		case "all":
		    var dados = loadJsonData("spawn");
			global.inimigosMortos = 0
		    dados.qtdMax = dados.qtdMaxBase;
			global.pause = false; 
			global.pauseMenu = false;
			room_restart();
		break;
		case "paused":
			global.pause = false; 
			global.pauseMenu = false;
			desativaLayer("ui")
		break;
	}
}