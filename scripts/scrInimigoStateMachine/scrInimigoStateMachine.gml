enum I_ESTADO{
	PARADO,
	ANDANDO,
	CORRENDO,
	EXPLODIR,
	ATIRAR
}
function inimigoStateMachine(){
	if(!instance_exists(oEstrutura)) return;
	focox = oEstrutura.x
	focoy = oEstrutura.y
	var _dir = point_direction(x,y,focox,focoy)
	var _distancia = distance_to_object(oEstrutura)
	
	var _inimigo = [oAtirador,oMago]
	switch(estado){
		case I_ESTADO.PARADO:
			estado_txt = "parado"
			velh = 0
			velv = 0
			velocidade = 0
				if(array_tem(_inimigo, object_index) >= 500){
					estado = I_ESTADO.ANDANDO;
				}
				if(array_tem(_inimigo, object_index) && (_distancia <= 250)){
					estado = I_ESTADO.ATIRAR;
				}
		break;
		case I_ESTADO.ANDANDO:
			estado_txt = "andando"
			velh = lengthdir_x(velocidade, _dir)
			velv = lengthdir_y(velocidade, _dir)
			if(parar == true){
				if(array_tem(_inimigo, object_index) && (_distancia <= 250)){
					estado = I_ESTADO.PARADO;
				}
			} else if((object_index == oBombardeiro) && (_distancia < 200)){
				estado = I_ESTADO.CORRENDO;
			}
		break;
		case I_ESTADO.CORRENDO:
		estado_txt = "correndo"
			velocidade = velocidadeMax
			velh = lengthdir_x(velocidade, _dir)
			velv = lengthdir_y(velocidade, _dir)
			if((object_index == oBombardeiro) && (_distancia == 0)){
				estado = I_ESTADO.EXPLODIR;
			}
		break;
		case I_ESTADO.EXPLODIR:
			estado_txt = "explodir"
			danoCasa()
		break;
		case I_ESTADO.ATIRAR:
			estado_txt = "atirando"
			atiraInimigo()
		break;
	}
}


//teste
function array_tem(_array, _valor) {
	for (var i = 0; i < array_length(_array); i++) {
		if (_array[i] == _valor) return true;
	}
	return false;
}