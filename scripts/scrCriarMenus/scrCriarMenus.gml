function DestroyObjeto(_obj){
	instance_destroy(_obj)
}
function DesativaLayer(_ui){
	instance_deactivate_layer(_ui)
}
function AtivaLayer(_ui){
	instance_activate_layer(_ui)
}
//funcao auxiliar para criar todos os objetos de uma vez no objeto central
//por exemplo criamos um objeto obj_configuracao e no evento create inserimoss o criaMenu("Configuracao"),
//parra assim chamar o script responsável pelos objetos que irá ter no menu.
function criaMenu(menu){
	switch(menu){
		case "Inicio":
			criaObjetosMenuIniciar();
		break;
		case "Configuracao":
			criaObjetosMenuConfiguracao();
		break;
		case "Pause":
			if(!global.PauseMenu){
				criaObjetosMenuPause();
				global.PauseMenu = true;
			}
		break;
		case "Morte":
			criaObjetosMenuMorte();
		break;
	}
}
#region funções auxiliares para matar / destruir os objetos dos respectivos menus
function MataMenu(menu){
	switch(menu){
		case "Inicio":
			MataObjetosMenuIniciar();
		break;
		case "Configuracao":
			MataObjetosMenuConfiguracao();
		break;
	}
}
function MataObjetosMenuIniciar(){
	DestroyObjeto(oIniciar)
	DestroyObjeto(oSair)	
	DestroyObjeto(oAjustes)
}
function MataObjetosMenuConfiguracao(){
	DestroyObjeto(oVoltar)
	DestroyObjeto(oMenos)
	DestroyObjeto(oRecuar)
	DestroyObjeto(oSFX)
	DestroyObjeto(oLinguagem)
	DestroyObjeto(oFullscreen)
	DestroyObjeto(oMais)
	DestroyObjeto(oAvancar)
	DestroyObjeto(oBotao)
}


#region funções auxiliares para a criação dos objetos de menu, podendo ajustar o x e o y de cada objeto
// Os recursos de script mudaram para a v2.3.0; veja
function criaObjetosCentralizado(objeto, _x, _y){
    var _dados_camera = dados_camera();
    var center_x = _dados_camera.center_x;
    var center_y = _dados_camera.center_y;
    // Verifica se já existe uma instância do objeto
    if (!instance_exists(objeto)) {
        // Cria a instância na camada "ui"
		instance_create_layer(center_x + _x, center_y + _y, "ui", objeto);
	}
}
//que irá ter nessse menu
function criaObjetosMenuConfiguracao(){
	criaObjetosCentralizado(oVoltar, -400, 0);
	criaElementosComun(400,0);
}
function criaObjetosMenuIniciar(){
	var y_position = 0
	criaObjetosCentralizado(oIniciar, 0,y_position)
	y_position += 50
	criaObjetosCentralizado(oAjustes, 0,y_position)
	y_position += 50
	criaObjetosCentralizado(oSair, 0,y_position)
}
function criaObjetosMenuPause(){
	var y_position = 0;
    criaObjetosCentralizado(oVoltar, 0, y_position);
    y_position += 50;
    criaObjetosCentralizado(oReiniciar, 0, y_position);
    y_position += 50;
    criaObjetosCentralizado(oSair, 0, y_position);
	criaElementosComun(400,0)
}
function criaObjetosMenuMorte(){
	var y_position = 0
	criaObjetosCentralizado(oReiniciar, 0,y_position)
	y_position += 50
	criaObjetosCentralizado(oSair, 0,y_position)
}
function criaElementosComun(x_position,y_position){
	criaObjetosCentralizado(oMenos,x_position - 50,0)
	criaObjetosCentralizado(oRecuar,x_position - 50,50)
	criaObjetosCentralizado(oSFX,x_position + 50, 0)
	criaObjetosCentralizado(oLinguagem,x_position + 50,50)
	criaObjetosCentralizado(oFullscreen,x_position,100)
	
	x_position += 100
	criaObjetosCentralizado(oMais,x_position + 50,0)
	criaObjetosCentralizado(oAvancar,x_position + 50,50)
	criaObjetosCentralizado(oBotao,x_position + 50,100)
}
#endregion