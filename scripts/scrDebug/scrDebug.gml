function chamaDebug(qual,estado){
	var mensagem = "";
	switch(qual){
		case "Pause":
			mensagem = "Jogo " + (estado ? "Pausado" : "Resumido");
			break;
			
		case "FullScreen":
			mensagem = "Fullscreen " + (estado ? "Ligado" : "Desligado");
			break;
			
		case "Debug":
			mensagem = "Debug " + (estado ? "Ligado" : "Desligado");
			break;
			
		default:
			mensagem = "Debug: Açao desconhecida"
			break;
	}
	show_debug_message(mensagem);
}

function debug(_debug){
	switch(_debug){
		//debugs do objeto global
		case "global":
			if(global.debug){
				if(instance_exists(oGlobal)){
					draw_text(x,y, "objeto global existe")
				} else {
					draw_text(x,y, "objeto global nao existe")
				}
				draw_text(x,y,"objeto global existe")
				if(global.pause){
					draw_text(x,y + 20,"pausado")
				} else {
					draw_text(x,y + 20,"rodando")
				}
				draw_text(x, y + 60, "Volume: " + string(global.sfx))
				draw_text(x, y + 80, "FullScreen: " + string(global.fullscreen))
				draw_text(x,y + 100, game_get_speed(gamespeed_fps))
			}
			if(instance_exists(oGlobal)){
				draw_text(x,y,"objeto global existe")
			}
		break;
		case "camera":
			if(global.debug){
				draw_text(x,y,"objeto camera existe")
			}
		break;
		case "entidade":
			if(global.debug){
				draw_set_valign(1)
				draw_set_halign(1)
				draw_text(x, y - sprite_height, estado_txt)
				draw_text(x - 30,y,velocidade)
				draw_text(x, y + 25, "x: " + string(velh))
				draw_text(x, y + 35, "y: " + string(velv))
				draw_text(x + 50,y,distance_to_object(oCasa))
				draw_set_valign(-1)
				draw_set_halign(-1)
			}
		break;
		case "player":
			if (global.debug){
				draw_set_valign(1)
				draw_set_halign(1)
				draw_text(x, y + 45, "Energia: " + string(energia) + " / " + string(energia_max));
				draw_text(x,y + 65, string(arma));
				draw_set_valign(-1)
				draw_set_halign(-1)
				
			}
		break;
		case "inimigo":
			if(global.debug){
				draw_set_valign(1)
				draw_set_halign(1)
				var _circle_1 = draw_circle_color(x,y,850,c_blue,c_blue, true)
				var _circle_2 = draw_circle_color(x,y,500,c_green,c_green, true)
				var _circle_3 = draw_circle_color(x,y,200,c_red,c_red, true)
				draw_text(x - 60,y + 15, "Vida: " + string(self.vida))
				draw_set_valign(-1)
				draw_set_halign(-1)
			}
		break;
		case "estrutura":
			if(global.debug){
				draw_set_valign(1)
				draw_set_halign(1)
				var _circle_1 = draw_circle_color(x,y,850,c_blue,c_blue, true)
				var _circle_2 = draw_circle_color(x,y,500,c_green,c_green, true)
				var _circle_3 = draw_circle_color(x,y,200,c_red,c_red, true)
				//draw_text(x - 60,y + 15, "Vida: " + string(self.vida))
				draw_set_valign(-1)
				draw_set_halign(-1)
			}
		break;
		case "atirador":
			if(global.debug){
				// Evento Draw
				var bar_width = 100;
				var bar_height = 20;
				var bar_x = x - bar_width / 2;
				var bar_y = y - 70;
				var progress = 1 - (tiro_timer / 120);
				var texto = string(floor((1 - progress) * 120)) + " frames";
				draw_text(bar_x, bar_y - 20, texto)
				// Desenhar o fundo da barra
				draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);
				// Desenhar a barra de progresso
				draw_rectangle_color(bar_x, bar_y, bar_x + bar_width * progress, bar_y + bar_height, c_blue, c_blue, c_blue, c_blue, false);
			}
		break;
	}
}