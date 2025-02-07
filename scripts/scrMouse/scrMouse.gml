// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

//função geral para checar a colisão do mouse e afins, essa funçao será a função pai para tudo que envolver
//o mouse
function checar_mouse(som){
	MouseColisao(som);
	mouseAlterImage();
	ChecaBotaoObjeto();
}
//função responsável por alterar alguma informação da imagem, como sua angulação.
function mouseAlterImage(){
	if(position_meeting(mouse_x,mouse_y,self)){
		image_index = 1
		image_angle = 4
		image_alpha = 1
	} else {
		image_index = 0
		image_angle = 0
		image_alpha = 1
	}
}

//função para verificar se o mouse está sobre um objeto e tocar o som respectivo
function MouseColisao(_som){
	// Verifique se o mouse está sobre o objeto
	if (position_meeting(mouse_x,mouse_y,self)){
		// Verifique se é a primeira vez que o mouse entrou
		if (!mouse_entered){
			// Marcar que o mouse entrou no objeto
			mouse_entered = true;
			// Tocar o som
			audio_play_sound(_som, 1, false,global.sfx);
			
		}
	} else {
		// Se o mouse saiu, marque como false
		mouse_entered = false;
	}
}

//função auxiliar para verificar cliques em objetos, chamar a função no checa_click
function verificaClick(_objetos){ 
	if (array_length(_objetos) == 0) return;
	for (var i = 0; i < array_length(_objetos); i++){
		if(position_meeting(mouse_x,mouse_y, _objetos[i].obj)){
			show_debug_message("Objeto clicado: " + object_get_name(_objetos[i].obj))
			_objetos[i].action(); // Executa a função associada ao objeto
			break // Sai do loop após encontrar a ação correspondente
		}
	}
}

//função para verificar os objetos e se o mb_left foi pressionado, 
//assim executando uma ação definida para o objeto
function ChecaBotaoObjeto(){
	if(mouse_check_button_pressed(mb_left) && !global.click_processed){
		global.click_processed = true;
	var _objetos = []
	//verifica a sala atual e defines ações a objetos correspondentes
	switch(room){
		case rMenu:
			_objetos = [
				{obj: oIniciar, action: function() { room_goto(rJogo); } },
				{obj: oSair, action: function() { game_end(); } },
				/*room_goto(rConfiguracao)*/
				{obj: oAjustes, action: function() { MataMenu("Inicio"); criaMenu("Configuracao"); } },
				
				{obj: oVoltar, action: function() { MataMenu("Configuracao"); criaMenu("Inicio"); } },
				{obj: oMenos, action: function() { globalAudio("sfx","Diminuir"); } },
				{obj: oMais, action: function() { globalAudio("sfx","Aumentar"); } },
				{obj: oAvancar, action: function() { switchLanguage("Avancar"); } },
				{obj: oRecuar, action: function() { switchLanguage("Voltar"); } },
				{obj: oBotao, action: function() { changeFullscreen(); } }
			];
		break;
		case rJogo:
			_objetos = [
				{obj: oVoltar, action: function() { DesativaLayer("ui"); global.pause = false; global.PauseMenu = false} },
				{obj: oReiniciar, action: function() { room_restart(); global.pause = false; global.PauseMenu = false } },
				{obj: oSair, action: function() { game_end(); } },
				{obj: oMenos, action: function() { globalAudio("sfx","Diminuir"); } },
				{obj: oMais, action: function() { globalAudio("sfx","Aumentar"); } },
				{obj: oAvancar, action: function() { switchLanguage("Avancar"); } },
				{obj: oRecuar, action: function() { switchLanguage("Voltar"); } },
				{obj: oBotao, action: function() { changeFullscreen(); } }
				
			];
		break;
		//case rConfiguracao:
		//	_objetos = [
		//		{obj: oVoltar, action: function() { room_goto(rMenu); } },
		//		{obj: oMenos, action: function() { globalAudio("sfx","Diminuir"); } },
		//		{obj: oMais, action: function() { globalAudio("sfx","Aumentar"); } },
		//		{obj: oAvancar, action: function() { switchLanguage("Avancar"); } },
		//		{obj: oRecuar, action: function() { switchLanguage("Voltar"); } },
		//		{obj: oBotao, action: function() { changeFullscreen(); } }
		//	];
		//break;
	}
	verificaClick(_objetos);
	} else if(!mouse_check_button_pressed(mb_left)){
		global.click_processed = false;
	}
}

#region funções de teste
//function detecta_mouse(_img_ind_inside,_img_ang_inside,_img_alp_inside,_img_ind_out,_img_ang_out,_img_alp_out){
//	if(position_meeting(mouse_x,mouse_y,self)){
//		image_index = _img_ind_inside
//		image_angle = _img_ang_inside
//		image_alpha = _img_alp_inside
//	} else {
//		image_index = _img_ind_inside
//		image_angle = _img_ang_inside
//		image_alpha = _img_alp_inside
//	}
//}

#endregion