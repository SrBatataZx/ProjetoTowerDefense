//funcao para obter os dados dos inimigos
function getInimigoData(tipo_inimigo){
	var _inimigos = load_json_data().inimigos;
	for (var i = 0; i < array_length(_inimigos); i++) {
	    if (_inimigos[i].funcao == tipo_inimigo) {
	        return _inimigos[i];
	    }
	}
	show_error("Inimigo não encontrado no JSON: " + tipo_inimigo, true);
	return noone;
}
//funcao para obter os dados dos multiplicadores
function getInimigoMultiplicadorData(nivel){
	var _multiplicadores = load_json_data().multiplicadores;
	for (var i = 0; i < array_length(_multiplicadores); i++) {
	    if (_multiplicadores[i].nivel == nivel) {
	        return _multiplicadores[i];
	    }
	}
	show_error("Nivel não encontrado no JSON: " + nivel, true);
	return noone;
}
//funcao para obter os dados das armas
function getInimigoArmasData(tipo){
	var _armas = load_json_data().tiros;
	for (var i = 0; i < array_length(_armas); i++) {
	    if (_armas[i].tipo == tipo) {
	        return _armas[i];
	    }
	}
	show_error("Nivel não encontrado no JSON: " + tipo, true);
	return noone;
}
//funcao para calcular o status do inimigo
function statusInimigo(tipo,nivel){
	var _inimigo_data = getInimigoData(tipo);
	if (_inimigo_data == noone) return;
	var _multiplicador_data = getInimigoMultiplicadorData(nivel);
	if (_multiplicador_data == noone) return;
	
	vida = _inimigo_data.status.vida;
	dano = _inimigo_data.status.dano * _multiplicador_data.status_mult.dano;
	vel = _inimigo_data.status.velo * _multiplicador_data.status_mult.velo;
	
	if(tipo == "bombardeiro"){
		max_vel = _inimigo_data.status.max_velo;
	}
}
//funcao para calcular o status da arma do inimigo
function statusInimigoArma(tipo){
	var _armas_data = getInimigoArmasData(tipo);
	if (_armas_data == noone) return;
	dano = _armas_data.status_tiro.dano
	vel = _armas_data.status_tiro.velo
}