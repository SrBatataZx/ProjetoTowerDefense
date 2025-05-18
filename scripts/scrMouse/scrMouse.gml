// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

//função geral para checar a colisão do mouse e afins
//essa funçao será a função pai para tudo que envolver o mouse
function checarMouse(_som){
	mouseColisao(_som);
	checaBotaoObjeto();
	mouseAlterImage();
}
//função responsável por alterar alguma informação da imagem, como sua angulação.
function mouseAlterImage() {
	var _mouseOn = position_meeting(mouse_x, mouse_y, self.id);

	if (_mouseOn) {
		image_index = 1;

		if (object_index != oBotao) {
			image_angle = 4;
			image_alpha = 1;
		}
	} else {
		image_index = 0;

		if (object_index != oBotao) {
			image_angle = 0;
			image_alpha = 1;
		}
	}
}

//função para verificar se o mouse está sobre um objeto e tocar o som respectivo
function mouseColisao(_som){
    if (position_meeting(mouse_x, mouse_y, self.id)) {
        if (!mouse_entered) {
            mouse_entered = true;
            som_id = audio_play_sound(_som, 1, false, global.sfx);
        }
    } else {
        if (mouse_entered) {
            if (audio_is_playing(som_id)) {
                audio_stop_sound(som_id);
            }
            mouse_entered = false;
        }
    }
}

//função auxiliar para verificar cliques em objetos, chamar a função no checaBotaoObjeto
function verificaClick(_objetos) {
	if (array_length(_objetos) == 0) return;

	for (var i = 0; i < array_length(_objetos); i++) {
		if (position_meeting(mouse_x, mouse_y, _objetos[i].obj)) {
			var inst = instance_position(mouse_x, mouse_y, _objetos[i].obj);
			if (inst != noone) {
				var debug_msg = "Objeto clicado: " + object_get_name(_objetos[i].obj);

				if (variable_instance_exists(inst, "botaoFuncao")) {
					debug_msg += " (Função: " + string(inst.botaoFuncao) + ")";
				}

				show_debug_message(debug_msg);
				_objetos[i].action(inst);
			}
			break;
		}
	}
}

//função para verificar os objetos e se o mb_left foi pressionado, 
//assim executando uma ação definida para o objeto
function checaBotaoObjeto(){
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
					{obj: oAjustes, action: function() { menu("mataMenu","Inicio"); menu("criaMenu","Configuracao"); } },
					{obj: oVoltar, action: function() { menu("mataMenu","Configuracao"); menu("criaMenu","Inicio"); } },
					{obj: oMenos, action: function() { globalAudio("sfx","Diminuir"); } },
					{obj: oMais, action: function() { globalAudio("sfx","Aumentar"); } },
					{obj: oAvancar, action: function(inst) {
						switch (inst.botaoFuncao) {
							case "recuar": substituirLinguagem("Avancar"); break;
							case "avancar": substituirLinguagem("Voltar"); break;
							default: show_debug_message("Função desconhecida: " + string(inst.botaoFuncao));
							}
						} 
					},
					{obj: oBotao, action: function(inst) {
						switch (inst.botaoFuncao) {
							case "fullscreen": changeFullscreen(); break;
							case "acessibilidade": changeAcessibilidade(); break;
							default: show_debug_message("Função desconhecida: " + string(inst.botaoFuncao));
							}
						} 
					}
				];
			break;
			case rJogo:
				_objetos = [
					{obj: oVoltar, action: function() { desativaLayer("ui"); global.pause = false; global.pauseMenu = false} },
					{obj: oReiniciar, action: function() { room_restart(); global.pause = false; global.pauseMenu = false } },
					{obj: oSair, action: function() { game_end(); } },
					{obj: oMenos, action: function() { globalAudio("sfx","Diminuir"); } },
					{obj: oMais, action: function() { globalAudio("sfx","Aumentar"); } },
					{obj: oAvancar, action: function(inst) {
						switch (inst.botaoFuncao) {
							case "recuar": substituirLinguagem("Avancar"); break;
							case "avancar": substituirLinguagem("Voltar"); break;
							default: show_debug_message("Função desconhecida: " + string(inst.botaoFuncao));
							}
						} 
					},
					{obj: oBotao, action: function(inst) {
						switch (inst.botaoFuncao) {
							case "fullscreen": changeFullscreen(); break;
							case "acessibilidade": changeAcessibilidade(); break;
							default: show_debug_message("Função desconhecida: " + string(inst.botaoFuncao));
							}
						}
					}
				];
			break
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