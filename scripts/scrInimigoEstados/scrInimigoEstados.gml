enum I_ESTADO{
	PARADO,
	ANDANDO
}
function atualiza_i_estado(){
	switch(estado){
		case I_ESTADO.PARADO:
			estado_txt = "parado"
			velh = 0
			velv = 0
			if(distance_to_object(oCasa) >= 500){
				estado = I_ESTADO.ANDANDO;
			}
		break;
		case I_ESTADO.ANDANDO:
			estado_txt = "andando"
			if(distance_to_object(oCasa) <= 300){
				estado = I_ESTADO.PARADO;
			}
			var _dir = point_direction(x,y,focox,focoy)
			velh = lengthdir_x(vel, _dir)
			velv = lengthdir_y(vel, _dir)
		break;
	}
}