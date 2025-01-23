//// Os recursos de script mudaram para a v2.3.0; veja
//// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
//function menu_switch(){
//	switch(menu_level){
//		//menu inicio
//		case 0:
//			if(position_meeting(mouse_x,mouse_y,oIniciar)){
//				if(mouse_check_button_pressed(1)){
//					room_goto(rJogo)
//				}
//			}
//			if(position_meeting(mouse_x,mouse_y,oConfiguracao)){
//				if(mouse_check_button_pressed(1)){
//					destruir_menu(menu_level);
//					menu_level = 1
//				}
//			}
//			if(position_meeting(mouse_x,mouse_y,oSair)){
//				if(mouse_check_button_pressed(1)){
//					game_end()
//				}
//			}
//		break
//		//menu principal configuracao
//		case 1:
//			if(position_meeting(mouse_x,mouse_y,oVoltar)){
//				if(mouse_check_button_pressed(1)){
//					destruir_menu(menu_level);
//					menu_level = 0
//				}
//			}
//			if(position_meeting(mouse_x,mouse_y,oSair)){
//				if(mouse_check_button_pressed(1)){
//					game_end()
//				}
//			}
//		break
//		case 2:
//			if(position_meeting(mouse_x,mouse_y,oVoltar)){
//				if(mouse_check_button_pressed(1)){
//					destruir_menu(menu_level);
//					global.pause = false
//				}
//			}
//			if(position_meeting(mouse_x,mouse_y,oConfiguracao)){
//				if(mouse_check_button_pressed(1)){
//				}
//			}
//			if(position_meeting(mouse_x,mouse_y,oSair)){
//				if(mouse_check_button_pressed(1)){
//					game_end()
//				}
//			}
//		break
//	}
//}
//// Função para destruir os objetos do menu atual
//function destruir_menu(menu_level) {
//    // Obter todos os objetos do menu atual e destruí-los
//    for (var i = 0; i < op_length; i++) {
//        var opcao_atual = opcao[menu_level,i];
//        if (opcao_atual != undefined) {
//            // Verifica se a instância do objeto existe e destrói
//            if (instance_exists(opcao_atual)) {
//                with (opcao_atual) {
//                    instance_destroy();
//                }
//            }
//        }
//    }
//}