enum I_ESTADO{
	PARADO,
	ANDANDO,
	CORRENDO,
	EXPLODIR,
	ATIRAR
}
function inimigoStateMachine(_inimigo){
	if(!instance_exists(oCasa)) return;
	focox = oCasa.x
	focoy = oCasa.y
	var _dir = point_direction(x,y,focox,focoy)
	var _distancia = distance_to_object(oCasa)
	switch(estado){
		case I_ESTADO.PARADO:
			estado_txt = "parado"
			velh = 0
			velv = 0
			velocidade = 0
				if(_distancia >= 500){
					estado = I_ESTADO.ANDANDO;
				}
				if((_inimigo == oAtirador) && (_distancia <= 400)){
					estado = I_ESTADO.ATIRAR;
				}
		break;
		case I_ESTADO.ANDANDO:
			estado_txt = "andando"
			velh = lengthdir_x(velocidade, _dir)
			velv = lengthdir_y(velocidade, _dir)
			if(parar == true){
				if((_inimigo == oAtirador) && (_distancia <= 400)){
					estado = I_ESTADO.PARADO;
				}
				if(_distancia <= 300){
					estado = I_ESTADO.PARADO;
				}
			} else if((_inimigo == oBombardeiro) && (_distancia < 200)){
				estado = I_ESTADO.CORRENDO;
			}
		break;
		case I_ESTADO.CORRENDO:
		estado_txt = "correndo"
			velocidade = velocidade_max
			velh = lengthdir_x(velocidade, _dir)
			velv = lengthdir_y(velocidade, _dir)
			if((_inimigo == oBombardeiro) && (_distancia == 0)){
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