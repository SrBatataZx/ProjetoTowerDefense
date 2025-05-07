//funcao para obter os dados dos inimigos
function getInimigoData(tipo_inimigo){
	var _inimigos = loadJsonData().inimigos;
	for (var i = 0; i < array_length(_inimigos); i++) {
	    if (_inimigos[i].inimigo == tipo_inimigo) {
	        return _inimigos[i];
	    }
	}
	show_error("Inimigo não encontrado no JSON: " + tipo_inimigo, true);
	return noone;
}
//funcao para obter os dados das armas
function getInimigoArmasData(tipo){
	var _armas = loadJsonData().tiros;
	for (var i = 0; i < array_length(_armas); i++) {
	    if (_armas[i].tipo == tipo) {
	        return _armas[i];
	    }
	}
	show_error("Nivel não encontrado no JSON: " + tipo, true);
	return noone;
}
//funcao para calcular o status do inimigo
function statusInimigo(tipo){
	var _inimigo_data = getInimigoData(tipo);
	if (_inimigo_data == noone) return;
	vida = _inimigo_data.status.vida * _inimigo_data.status_por_nivel.nivel_1.vida;
	velocidade = _inimigo_data.status.velocidade
	if(tipo == "bombardeiro"){
		velocidade_max = _inimigo_data.status.velocidade_max;
		dano = _inimigo_data.status.ataque.dano
	}
}
//funcao para calcular o status da arma do inimigo
function statusInimigoArma(tipo){
	var _armas_data = getInimigoData(tipo);
	if (_armas_data == noone) return;
	dano = _armas_data.status.ataque.dano
	velocidade = _armas_data.status.ataque.velocidade
}