enum P_ESTADO{
	PARADO,
	ANDANDO,
	CORRENDO,
	CANSADO,
	ATIRANDO
}
#region atualiza o estado do player
function PlaterStateMachine(){
	var _up = keyboard_check(vk_up);
	var _down = keyboard_check(vk_down);
	var _left = keyboard_check(vk_left);
	var _right = keyboard_check(vk_right);
	var _shift = keyboard_check(vk_shift)
	var _mb_left = mouse_check_button(mb_left)
	
	var _is_moving = (_up xor _down) || (_left xor _right);
	
	switch(estado){
		case P_ESTADO.PARADO:
			estado_txt = "parado"
			velh = 0;
			velv = 0;
			vel = 0;
			//caso o player aperte uma das teclas, irá acionar o estado movendo.
			if(_is_moving){
				estado = P_ESTADO.ANDANDO;
			}
			restore_energy();
			ManipulaDisparo(_mb_left);
		break;
		case P_ESTADO.ANDANDO:
			estado_txt = "andando"
			//caso solte os 4 botoes, ira acionar o estado parado.
			if(!_is_moving){
				estado = P_ESTADO.PARADO;
			} else {
				if (_shift){//caso apertar shift, irá acionar o estado correndo.
					estado = P_ESTADO.CORRENDO;
				}
				//atualiza a velocidade(_vel) do player ativando a funcao s_atualiza_speed.
				vel = VEL;
				s_atualiza_speed(_right - _left, _down - _up, vel);
			}
			restore_energy(0.25);
			ManipulaDisparo(_mb_left);
		break;
		case P_ESTADO.CORRENDO:
			estado_txt = "correndo";
			//caso solte os 4 botoes, ira acionar o estado parado.
			if(!_is_moving){
				estado = P_ESTADO.PARADO;
			} else {
				if(!_shift){//caso soltar shift, irá voltar para o estado andando.
					estado = P_ESTADO.ANDANDO;
				}
				if(energia == 0){//caso a energia se esgote, irá acionar o estado de cansado.
					estado = P_ESTADO.CANSADO;
				}
				energia -= energia_cons;
				//atualiza a velocidade(_maxvel) do player ativando a funcao s_atualiza_speed.
				vel = maxvel;
				s_atualiza_speed(_right - _left, _down - _up, vel);
			}
			ManipulaDisparo(_mb_left)
		break;
		case P_ESTADO.CANSADO:
			estado_txt = "cansado"
			//zerando as velocidades do player
			velh = 0
			velv = 0
			restore_energy();
			if(energia >= 50){//ao restaurar 50 de energia, o player irá para o estado parado, onde
				//esta livre para ir para qualquer outro estado.
				estado = P_ESTADO.PARADO
			}
		break;
		case P_ESTADO.ATIRANDO:
			PlayerTiro();
			if(_is_moving){
				estado = _shift ? P_ESTADO.CORRENDO : P_ESTADO.ANDANDO;
			} else {
				estado = P_ESTADO.PARADO;
			}
		break;
	}
	if(energia < 0) energia = 0;//travando a energia em 0 pois não existe energia negativa
}