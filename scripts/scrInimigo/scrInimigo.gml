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
			focox = oCasa.x
			focoy = oCasa.y
			var _dir = point_direction(x,y,focox,focoy)
			velh = lengthdir_x(vel, _dir)
			velv = lengthdir_y(vel, _dir)
		break;
	}
}

#region status do inimigo
function status_inimigo(tipo_inimigo, level){
//script para puxar o inimigo pelo nome, modo de inserir: crie um objeto do inimigo;
//no evento create voce irá puxar status_inimigo()
//após puxar voce irá alterar o nome dentro dos parenteses ("bombardeiro"), no meu arquivo json de status tenho
//bombardeiro, atirador e mágico, qualquer outro que não existir no arquivo json irá dar problema.
	var _json_string = file_text_open_read("st_inimigo.json")
	var json_data = "";
	while (!file_text_eof(_json_string)) {
		json_data += file_text_readln(_json_string);
	}
	file_text_close(_json_string);
	
	#region dados do inimigo
	var _inimigos = json_parse(json_data);
	var _tipo_inimi = tipo_inimigo;
	var _inimigo_data = noone;
	for (var i = 0; i < array_length(_inimigos.inimigos); i++) {
	    if (_inimigos.inimigos[i].funcao == _tipo_inimi) {
	        _inimigo_data = _inimigos.inimigos[i];
	        break;
	    }
	}
	//var _multiplicadores = json_parse(json_data);
	var _nivel_mult = level;
	var _mult_data = noone;
	for (var i = 0; i < array_length(_inimigos.multiplicadores); i++) {
	    if (_inimigos.multiplicadores[i].nivel == _nivel_mult) {
	        _mult_data = _inimigos.multiplicadores[i];
	        break;
	    }
	}
	vel = (_inimigo_data.status.velo) * ( _mult_data.status_mult.velo);
	#endregion
}
#endregion