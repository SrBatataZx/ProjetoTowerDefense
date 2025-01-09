enum P_ESTADO{
	PARADO,
	ANDANDO,
	CORRENDO,
	CANSADO
}
#region atualiza o estado do player
function atualiza_p_estado(){
	#region setando os botoes virtuais para cada movimento
	var _up = keyboard_check(vk_up);
	var _down = keyboard_check(vk_down);
	var _left = keyboard_check(vk_left);
	var _right = keyboard_check(vk_right);
	var _shift = keyboard_check(vk_shift)
	#endregion
	#region estados do player
	switch(estado){
		case P_ESTADO.PARADO:
			estado_txt = "parado"
			velh = 0;
			velv = 0;
			//caso o player aperte uma das teclas, irá acionar o estado movendo.
			if((_up xor _down) or (_left xor _right)){
				estado = P_ESTADO.ANDANDO;
			}
			if(energia < energia_max){//ação para restaurar a energia quando está parado
				energia += energia_rec;
				if(energia > energia_max) energia = energia_max;
			}
		break;
		case P_ESTADO.ANDANDO:
			estado_txt = "andando"
			//no estado correndo, caso solte os 4 botoes, ira acionar o estado parado.
			if(!(_up xor _down) && !(_left xor _right)){
				estado = P_ESTADO.PARADO;
			} else {
				if (_shift){//caso esteja no estado movendo e apertar shift, irá acionar o estado correndo.
					estado = P_ESTADO.CORRENDO;
				}
				//no estado movendo atualiza a velocidade(_vel) do player ativando a funcao s_atualiza_speed.
				_vel = vel;
				s_atualiza_speed(_right - _left, _down - _up, _vel);
			}
			if(energia < energia_max){
				energia += (energia_rec / 4);//ação para restaurar a energia mais devagar pois está em movimento
				if(energia > energia_max) energia = energia_max;
			}
		break;
		case P_ESTADO.CORRENDO:
			estado_txt = "correndo";
			//no estado correndo, caso solte os 4 botoes, ira acionar o estado parado.
			if(!(_up xor _down) && !(_left xor _right)){
				estado = P_ESTADO.PARADO;
			} else {
				if(!_shift){//caso esteja no estado correndo e soltar shift, irá acionar o estado correndo.
					estado = P_ESTADO.ANDANDO;
				}
				if(energia == 0){//caso a energia se esgote, irá acionar o estado de cansado.
					estado = P_ESTADO.CANSADO;
				}
				energia -= energia_cons;
				//no estado correndo atualiza a velocidade(_vel) do player ativando a funcao s_atualiza_speed.
				_maxvel = maxvel;
				s_atualiza_speed(_right - _left, _down - _up, _maxvel);
			}
		break;
		case P_ESTADO.CANSADO:
			estado_txt = "cansado"
			//zerando as velocidades do player
			velh = 0
			velv = 0
			if(energia < energia_max){//ação para restaurar a energia quando está no estado cansado
				energia += energia_rec;
				if(energia > energia_max) energia = energia_max;
			} 
			if(energia > 50){//ao restaurar 50 de energia, o player já irá para o estado parado, onde
				//está livre para ir para qualquer outro estado.
				estado = P_ESTADO.PARADO
			}
		break;
	}
	if(energia < 0) energia = 0;//travando a energia em 0 pois não existe energia ne
	//show_debug_message("Energia final: " + string(energia));
	#endregion
}
#endregion
function s_atualiza_speed(_dir_h, _dir_v, _max_vel){
	var _dir = point_direction(0,0,_dir_h,_dir_v);
	velh = lengthdir_x(_max_vel,_dir);
	velv = lengthdir_y(_max_vel,_dir);
}
#region notas sobre o script
//para esse script no oPlayer deve-se ter os seguintes eventos:
//Create - setando os seguintes dados
	//event_inherited(); //puxando os dados do oEntidade
	//vel = SPD //esse dado está salvo em um arquivo macro setado como #macro SPD 4
	//estado = P_ESTADO.PARADO;
	//estado_txt = "parado";
		//o que ocorre com o vel poderia ser aplicado nos dados de energia, salvando as informações em um macro
		//como apenas o player irá possuir energia eu não vi sentido em salvar em um macro.
	//energia = 100;
	//energia_max = 100;
	//energia_rec = 0.5;
	//energia_cons = .5;
	
	//keyboard_set_map(ord("W"),vk_up);
	//keyboard_set_map(ord("S"),vk_down);
	//keyboard_set_map(ord("A"),vk_left);
	//keyboard_set_map(ord("D"),vk_right);
//Step - apenas puxar a function que atualiza o estado do player
	// atualiza_p_estado()
//End Step - apenas parent do end step do oEntidade

//dados do oEntidade para funciona corretamente, lembrando que o oPlayer é filho do oEntidade.
//Create -
	//velh = 0
	//velv = 0
	//vel = VEL
	//maxvel = MAXVEL
	//_colisao = [oColisao]
//End Step -
	//if (place_meeting(x + velh, y, _colisao)){
	//	var _velh = sign(velh);
	//	while(!place_meeting(x + _velh, y, _colisao)){
	//		x += _velh
	//	}
	//	velh = 0;
	//}
	//x += round(velh);
	//if (place_meeting(x, y + velv, _colisao)){
	//	var _velv = sign(velv);
	//	while(!place_meeting(x, y + _velv, _colisao)){
	//		y += _velv
	//	}
	//	velv = 0;
	//}
	//y += round(velv);
#endregion