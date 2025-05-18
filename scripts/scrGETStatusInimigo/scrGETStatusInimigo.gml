/// @function							getInimigoData(_inimigo)
/// @param {string} _inimigo			string que irá puxar a "data" com todos os status
///										do inimigosData no arquivo json
/// @description função auxiliar que obtem os dados do arquivo json para o sistema de status do inimigo
function getInimigoData(_inimigo){
	var _inimigos = loadJsonData("status").inimigosData;
	for (var i = 0; i < array_length(_inimigos); i++){
	    if (_inimigos[i].inimigo == _inimigo) {
	        return _inimigos[i];
	    }
	}
	show_error("Inimigo não encontrado no JSON: " + _inimigo, true);
	return noone;
}

/// @function							satusInimigo(_inimigo)
/// @param {string} _inimigo			define o status para o inimigo.
///	@param {bool}	_projetil			se 1 (ativo) define o status para o projetil do inimigo. Padrão 0 (falso), parametro necessário apenas se o inimigo tiver projetil.
/// @description função principal para definir o status do inimigo de acordo com o getInimigoData() e o arquivo json
function statusInimigo(_inimigo, _projetil){
	if (is_undefined(_projetil)) _projetil = 0;
	switch(_projetil){
		case 0:
			var _inimigo_data = getInimigoData(_inimigo);
			if (_inimigo_data == noone) return;
	
			vida = _inimigo_data.status.vida * _inimigo_data.statusPorNivel.nivel_1.vida;
			velocidade = _inimigo_data.status.velocidade
			
			moedasMin = _inimigo_data.drops.moedasMin
			moedasMax =  _inimigo_data.drops.moedasMax
			
			if(_inimigo == "bombardeiro"){
				velocidadeMax = _inimigo_data.status.velocidadeMax;
				dano = _inimigo_data.status.ataque.dano
			}
		break;
		case 1:
			var _armas_data = getInimigoData(_inimigo);
			if (_armas_data == noone) return;
			dano = _armas_data.status.ataque.dano
			velocidade = _armas_data.status.ataque.velocidade
		break;
	}
}