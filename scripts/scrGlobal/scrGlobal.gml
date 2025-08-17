// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
// Função para verificar teclas pressionadas e realizar as ações
function checaTeclaPressionada(){
    if (tipoTecla("pressed", TOGGLE_DEBUG)) {
        global.debug = !global.debug;
        chamaDebug("Debug", global.debug);
        return;
    }
    
    if (tipoTecla("pressed", RESTART_GAME)) {
        game_restart();
        return;
    }
    
    if (tipoTecla("pressed", TOGGLE_PAUSE1) || tipoTecla("pressed", TOGGLE_PAUSE2)) {
        handlePauseState();
        return;
    }
    
    if (tipoTecla("pressed", TOGGLE_FULLSCREEN)) {
        toggleFullscreen();
    }
}
//funcao auxiliar para checar a forma que é assionada a tecla, e inclui a tecla em si na verificação.
function tipoTecla(tipo,tecla){
	switch(tipo){
		case "pressed": return keyboard_check_pressed(tecla);
		case "released": return keyboard_check_released(tecla);
		default: return false;
	}
}
//funcao auxiliar para setar a forma da tela
function toggleFullscreen(){
	global.fullscreen = !global.fullscreen
	window_set_fullscreen(global.fullscreen)
	salvarConfig("FullScreen", global.fullscreen);
	chamaDebug("FullScreen", window_get_fullscreen())
}
function handlePauseState() {
    global.pause = !global.pause;
    
    switch (global.pauseMenu) {
        case 1:
            resetGameData("paused");
            break;
            
        case 0:
			if(room == rJogo && !global.morteMenu){
				menu("criaMenu","Pause")
			} else if(room == rLobby){
				menu("criaMenu","Lobby")
			}
            break;
    }
    
    chamaDebug("Pause", global.pause);
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