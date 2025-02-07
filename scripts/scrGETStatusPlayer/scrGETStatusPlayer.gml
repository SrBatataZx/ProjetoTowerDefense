//funcao para obter os dados da arma do player

function getPlayerArmaData(tipo_arma){
	var _armas = load_json_data().playerArmas;
	for (var i = 0; i < array_length(_armas); i++){
		if (_armas[i].tipo == tipo_arma){
			return _armas[i];
		}
	}
	return noone;
}

//funcao para calcular status da arma do player
function statusPlayerArma(tipo){
	var _armas_data = getPlayerArmaData(tipo);
	if (_armas_data == noone) return;
	dano = _armas_data.status.dano
	vel = _armas_data.status.velo
	cd = _armas_data.status.temp
}