//funcao para obter os dados da arma do player

function getPlayerArmaData(tipo_arma){
	var _armas = loadJsonData().playerArmas;
	for (var i = 0; i < array_length(_armas); i++){
		if (_armas[i].arma == tipo_arma){
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
	velocidade = _armas_data.status.velocidade
	tempo_recarga = _armas_data.status.tempo_recarga
}