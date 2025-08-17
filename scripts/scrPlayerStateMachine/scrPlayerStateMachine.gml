enum P_ESTADO {
    PARADO,
    ANDANDO,
    CORRENDO,
    AVANCAR,
    CANSADO
}

function playerStateMachine() {
    // Input handling otimizado
    var _inputs = getInputs();
    
    // State machine core
    estado = handleStateTransitions(estado, _inputs);
    executeStateActions(estado, _inputs);
    
    // Garante energia dentro dos limites
    energia = clamp(real(energia), 0, real(energiaMax));
}
#region scrAuxiliar
function getInputs() {
	return {
		up: keyboard_check(vk_up),
		down: keyboard_check(vk_down),
		left: keyboard_check(vk_left),
		right: keyboard_check(vk_right),
		shift: keyboard_check(vk_shift),
		seMexendo: (keyboard_check(vk_up) xor keyboard_check(vk_down)) || (keyboard_check(vk_left) xor keyboard_check(vk_right)),
		hInput: keyboard_check(vk_right) - keyboard_check(vk_left),
		vInput: keyboard_check(vk_down) - keyboard_check(vk_up)
	};
}
//funcao auxiliar responsavel por setar velh e velv do player de acordo com a _max_vel
function atualizaVelocidade(_dir_h, _dir_v, _max_vel) {
    // Suavização de movimento (opcional)
    var _target_velh = lengthdir_x(_max_vel, point_direction(0, 0, _dir_h, _dir_v));
    var _target_velv = lengthdir_y(_max_vel, point_direction(0, 0, _dir_h, _dir_v));
    
    velh = lerp(velh, _target_velh, 0.2); // Interpolação suave
    velv = lerp(velv, _target_velv, 0.2);
    
    // Alternativa original (mais precisa)
    // velh = lengthdir_x(_max_vel, point_direction(0, 0, _dir_h, _dir_v));
    // velv = lengthdir_y(_max_vel, point_direction(0, 0, _dir_h, _dir_v));
}

// Sistema de energia com callbacks
function restauraEnergia(factor = 1) {
    if (energia < energiaMax) {
        var _regen = energiaRec * factor * (1 /*+ global.energyBonus*/); // Bônus global opcional
        
        energia = min(energia + _regen, energiaMax);
        
        // Callback visual (opcional)
        if (factor == 1 && energia == energiaMax) {
            event_user(0); // Dispara evento de energia cheia
        }
    }
}
function handleStateTransitions(current_state, _inputs) {
    switch(current_state) {
        case P_ESTADO.PARADO:    return handleParado(_inputs.seMexendo);
        case P_ESTADO.ANDANDO:   return handleAndando(_inputs.seMexendo, _inputs.shift);
        case P_ESTADO.CORRENDO:  return handleCorrendo(_inputs.seMexendo, _inputs.shift);
        case P_ESTADO.CANSADO:   return handleCansado();
        default:                 return P_ESTADO.PARADO;
    }
}

function executeStateActions(current_state, _inputs) {
    switch(current_state) {
        case P_ESTADO.PARADO:    executeParado(); break;
        case P_ESTADO.ANDANDO:   executeAndando(_inputs.hInput, _inputs.vInput); break;
        case P_ESTADO.CORRENDO:  executeCorrendo(_inputs.hInput, _inputs.vInput); break;
        case P_ESTADO.CANSADO:   executeCansado(); break;
    }
}
#endregion

// Transition handlers
function handleParado(_seMexendo) {
	return _seMexendo ? P_ESTADO.ANDANDO : P_ESTADO.PARADO;
}

function handleAndando(_seMexendo, _shift) {
	if (!_seMexendo) return P_ESTADO.PARADO;
	if (_shift && energia > 0) return P_ESTADO.CORRENDO;
	return P_ESTADO.ANDANDO;
}

function handleCorrendo(_seMexendo, _shift) {
	if (!_seMexendo) return P_ESTADO.PARADO;
	if (!_shift || energia <= 0) return P_ESTADO.CANSADO;
	return P_ESTADO.CORRENDO;
}

function handleCansado() {
	return (energia >= energiaMax * 0.5) ? P_ESTADO.PARADO : P_ESTADO.CANSADO;
}

// State executors
function executeParado() {
	estado_txt = "parado";
	velh = 0;
	velv = 0;
	vel = 0;
	restauraEnergia(); // Restaura energia mais rápido quando parado
}

function executeAndando(hInput, vInput) {
	estado_txt = "andando";
	vel = velocidade;
	atualizaVelocidade(hInput, vInput, vel);
	restauraEnergia(0.25); // Restaura mais devagar quando andando
}

function executeCorrendo(hInput, vInput) {
	estado_txt = "correndo";
	vel = velocidadeMax;
	atualizaVelocidade(hInput, vInput, vel);
	energia -= energiaCons; // Consome energia ao correr
}

function executeCansado() {
	estado_txt = "cansado";
	// Força o jogador a ficar parado
	velh = 0;
	velv = 0;
	vel = 0;
	restauraEnergia(); // Restaura energia enquanto cansado
	
	// Observação: O jogador só sairá deste estado quando handleCansado() permitir
	// (quando energia >= 50), independente de input
}

#region codigo antigo para visualização
//enum P_ESTADO{
//	PARADO,
//	ANDANDO,
//	CORRENDO,
//	AVANCAR,
//	CANSADO
//}
//#region atualiza o estado do player
//function playerStateMachine(){
//	var _up = keyboard_check(vk_up);
//	var _down = keyboard_check(vk_down);
//	var _left = keyboard_check(vk_left);
//	var _right = keyboard_check(vk_right);
//	var _shift = keyboard_check(vk_shift);
//	//var _mbRight = mouse_check_button_released(mb_right)
	
//	var _seMexendo = (_up xor _down) || (_left xor _right);
	
//	switch(estado){
//		case P_ESTADO.PARADO:
//			estado_txt = "parado"
//			velh = 0;
//			velv = 0;
//			vel = 0;
//			//caso o player aperte uma das teclas, irá acionar o estado movendo.
//			if(_seMexendo){
//				estado = P_ESTADO.ANDANDO;
//			}
//			restauraEnergia();
//		break;
//		case P_ESTADO.ANDANDO:
//			estado_txt = "andando"
//			//caso solte os 4 botoes, ira acionar o estado parado.
//			if(!_seMexendo){
//				estado = P_ESTADO.PARADO;
//			} else {
//				if (_shift){//caso apertar shift, irá acionar o estado correndo.
//					estado = P_ESTADO.CORRENDO;
//				}
//				//atualiza a velocidade(_vel) do player ativando a funcao atualizaVelocidade.
//				vel = velocidade;
//				atualizaVelocidade(_right - _left, _down - _up, vel);
				
//				//if(_mbRight){
//				//	estado = P_ESTADO.AVANCAR;
//				//}
//			}
//			restauraEnergia(0.25);
//		break;
//		case P_ESTADO.CORRENDO:
//			estado_txt = "correndo";
//			//caso solte os 4 botoes, ira acionar o estado parado.
//			if(!_seMexendo){
//				estado = P_ESTADO.PARADO;
//			} else {
//				if(!_shift){//caso soltar shift, irá voltar para o estado andando.
//					estado = P_ESTADO.ANDANDO;
//				}
//				if(energia == 0){//caso a energia se esgote, irá acionar o estado de cansado.
//					estado = P_ESTADO.CANSADO;
//				}
//				energia -= energiaCons;
//				//atualiza a velocidade(_maxvel) do player ativando a funcao atualizaVelocidade.
//				vel = velocidadeMax;
//				atualizaVelocidade(_right - _left, _down - _up, vel);
//			}
//		break;
//		case P_ESTADO.CANSADO:
//			estado_txt = "cansado"
//			//zerando as velocidades do player
//			velh = 0
//			velv = 0
//			restauraEnergia();
//			if(energia >= 50){//ao restaurar 50 de energia, o player irá para o estado parado, onde
//				//esta livre para ir para qualquer outro estado.
//				estado = P_ESTADO.PARADO
//			}
//		break;
//		//case P_ESTADO.AVANCAR:
//		//	x +=2
//		//break;
//	}
//	if(energia < 0) energia = 0;
//}
#endregion