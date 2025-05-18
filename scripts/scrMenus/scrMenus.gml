function desativaLayer(_ui){
	instance_deactivate_layer(_ui)
}
//function AtivaLayer(_ui){
//	instance_activate_layer(_ui)
//}

/// @function					menu(_atividade,_menu)
/// @param {string} _atividade	atividade a qual o menu irá realizar
/// @param {string} _menu		menu que será chamado
/// @description função auxiliar para o sistema de menus

function menu(_atividade,_menu){
	switch(_atividade){
		case "criaMenu":
			switch(_menu){
				case "Inicio":
					criaMenuIniciar();
				break;
				case "Configuracao":
					criaMenuConfiguracao();
				break;
				case "Pause":
					if(!global.pauseMenu){
						criaMenuPause();
						global.pauseMenu = true;
					}
				break;
				case "Morte":
					criaMenuMorte();
				break;
			}
		break;
		case "mataMenu":
			switch(_menu){
				case "Inicio":
					mataMenuIniciar();
				break;
				case "Configuracao":
					mataMenuConfiguracao();
				break;
			}
		break;
	}
}

function mataMenuIniciar(){
	destroyObjeto(oIniciar)
	destroyObjeto(oSair)	
	destroyObjeto(oAjustes)
}
function mataMenuConfiguracao(){
	destroyObjeto(oVoltar)
	destroyObjeto(oMenos)
	//destroyObjeto(oRecuar)
	destroyObjeto(oSFX)
	destroyObjeto(oLinguagem)
	destroyObjeto(oFullscreen)
	destroyObjeto(oMais)
	destroyObjeto(oAvancar)
	destroyObjeto(oBotao)
}

#region funções auxiliares para a criação dos objetos de menu, podendo ajustar o x e o y de cada objeto
function criaObjetosCentralizado(objeto, _x, _y, _funcao = ""){
    var _dadosCamera = dadosCamera();
    var center_x = _dadosCamera.center_x;
    var center_y = _dadosCamera.center_y;
	
	var inst = instance_create_layer(center_x + _x, center_y + _y, "ui", objeto);
	if (argument_count > 3 && variable_instance_exists(inst, "botaoFuncao")) {
	    inst.botaoFuncao = _funcao;
	}
    // Só cria se não existir nenhuma instância do tipo
    //if (!instance_exists(objeto)) {
    //    var inst = instance_create_layer(center_x + _x, center_y + _y, "ui", objeto);
        
    //    // Se a função foi passada e a instância tiver essa variável
    //    if (argument_count > 3 && variable_instance_exists(inst, "botaoFuncao")) {
    //        inst.botaoFuncao = _funcao;
    //    }
        
    //    return inst;
    //}
    //return noone;
}

//function criaBotaoComFuncao(_x, _y, funcao){
//	var _dadosCamera = dadosCamera();
//	var center_x = _dadosCamera.center_x;
//	var center_y = _dadosCamera.center_y;
//	var inst = instance_create_layer(center_x + _x, center_y + _y, "ui", oBotao);
//	inst.botaoFuncao = funcao;
//}
//que irá ter nessse menu
function criaMenuConfiguracao(){
	criaObjetosCentralizado(oVoltar, -400, 0);
	criaElementosComun(400,0);
}

function criaMenuIniciar(){
	var y_position = 0
	criaObjetosCentralizado(oIniciar, 0,y_position)
	y_position += 50
	criaObjetosCentralizado(oAjustes, 0,y_position)
	y_position += 50
	criaObjetosCentralizado(oSair, 0,y_position)
}
function criaMenuPause(){
	var y_position = 0;
    criaObjetosCentralizado(oVoltar, 0, y_position);
    y_position += 50;
    criaObjetosCentralizado(oReiniciar, 0, y_position);
    y_position += 50;
    criaObjetosCentralizado(oSair, 0, y_position);
	criaElementosComun(400,0)
}
function criaMenuMorte(){
	var y_position = 0
	criaObjetosCentralizado(oReiniciar, 0,y_position)
	y_position += 50
	criaObjetosCentralizado(oSair, 0,y_position)
}
function criaElementosComun(x_position,y_position){
	criaObjetosCentralizado(oMenos,x_position - 50,0)
	//criaObjetosCentralizado(oRecuar,x_position - 50,50)
	criaObjetosCentralizado(oAvancar,x_position - 50,50, "recuar")
	criaObjetosCentralizado(oSFX,x_position + 50, 0)
	criaObjetosCentralizado(oLinguagem,x_position + 50,50)
	criaObjetosCentralizado(oFullscreen,x_position,100)
	
	x_position += 100
	criaObjetosCentralizado(oMais,x_position + 50,0)
	criaObjetosCentralizado(oAvancar,x_position + 50,50, "avancar")
	//criaObjetosCentralizado(oBotao,x_position + 50,100)
	criaObjetosCentralizado(oBotao, x_position + 50, 100, "fullscreen"); // Botão que muda o fullscreen
	criaObjetosCentralizado(oBotao, x_position + 50, 150, "acessibilidade");   // Botão que abre o menu de configuração
}
#endregion