///script Get Dados
#region Estruturas
function getEstruturaData() {
    var dados = loadJsonData("status");
    if (is_struct(dados) && is_struct(dados.entidades) && is_struct(dados.entidades.estruturas)) {
        return dados.entidades.estruturas.casa;
    }
    return {};
}
function statusEstrutura(){
	var _dados = getEstruturaData();
	if (_dados == noone || !is_struct(_dados.status)) return;
	vida = _dados.status.vida;
	vidaMax = _dados.status.vidaMax;
}
#endregion

#region	Inimigo
/// @function							getInimigoData(_inimigo)
/// @param {string} _inimigo			string que irá puxar a "data" com todos os status
///										do inimigosData no arquivo json
/// @description função auxiliar que obtem os dados do arquivo json para o sistema de status do inimigo
function getInimigoData(_inimigo) {
    var _inimigosData = loadJsonData("inimigos").inimigosData;
    
    // Verifica se o inimigo existe no objeto
    if (variable_struct_exists(_inimigosData, _inimigo)) {
        return _inimigosData[$ _inimigo];
    }
    
    show_error("Inimigo não encontrado no JSON: " + _inimigo, true);
    return noone;
}


/// @function							satusInimigo(_inimigo)
/// @param {string} _inimigo			define o status para o inimigo.
///	@param {bool}	_projetil			se 1 (ativo) define o status para o projetil do inimigo. Padrão 0 (falso), parametro necessário apenas se o inimigo tiver projetil.
/// @description função principal para definir o status do inimigo de acordo com o getInimigoData() e o arquivo json
function statusInimigo(_inimigo, _projetil) {
    if (is_undefined(_projetil)) _projetil = 0;
	 var _inimigo_data = getInimigoData(_inimigo);
	 if (_inimigo_data == noone) return;
	
	 // Aplica modificadores de nível (assumindo nível 1 por padrão)
	 var _nivel = "_1"; // Poderia ser um parâmetro adicional
	 var _modificador = _inimigo_data.statusPorNivel[$ _nivel];
            
    switch(_projetil) {
        case 0: // Status do inimigo
            // Status base multiplicados pelos modificadores de nível
            vida = _inimigo_data.status.vida * _modificador.vida;
            velocidade = _inimigo_data.status.velocidade * _modificador.velocidade;
            
            // Drops
            moedasMin = _inimigo_data.drops.moedasMin;
            moedasMax = _inimigo_data.drops.moedasMax;
            
            // Status específicos para certos inimigos
            if (_inimigo == "bombardeiro") {
                velocidadeMax = _inimigo_data.status.velocidadeMax;
                dano = _inimigo_data.status.ataque.dano * _modificador.dano;
            } else {
                dano = _inimigo_data.status.ataque.dano * _modificador.dano;
            }
        break;
        
        case 1: // Status do projétil
            dano = _inimigo_data.status.ataque.dano * _modificador.dano;
            velocidade = _inimigo_data.status.ataque.velocidade;
        break;
    }
}
#endregion

#region Player
/// @function			statusPlayerArma(_arma, _raridade)
/// @param {string}		_arma		Nome da arma
/// @param {string}		_raridade	Raridade desejada (ex: "normal", "raro", "epico")
/// @description	Aplica os status da arma ao player com base na raridade

function statusPlayerArma(_arma, _raridade) {
	var _armasData = loadJsonData("armas").armasData;
	
	if (!variable_struct_exists(_armasData, _arma)) {
		show_error("Arma não encontrada no JSON: " + _arma, true);
		return;
	}
	
	var _dados = _armasData[$ _arma];
	if (!is_struct(_dados.status) || !is_struct(_dados.status.raridade)) return;
	
	// Verifica se a raridade existe, senão usa "normal" como padrão
	var _raridadeData;
	if (variable_struct_exists(_dados.status.raridade, _raridade)) {
		_raridadeData = _dados.status.raridade[$ _raridade];
	} else {
		_raridadeData = _dados.status.raridade.normal;
	}
	
	dano         = _raridadeData.dano;
	velocidade   = _raridadeData.velocidade;
	tempoRecarga = _raridadeData.tempoRecarga;
}
/// @function statusPlayer()
/// @description Carrega e aplica o status geral do player (ex: velocidade)
function statusPlayer() {
	var dados = loadJsonData("status");
	if (!is_struct(dados) || !is_struct(dados.entidades) || !is_struct(dados.entidades.player)) {
		return;
	}
	var _dados = dados.entidades.player;
	if (is_struct(_dados.status)) {
		velocidade = _dados.status.velocidade;
		velocidadeMax = _dados.status.velocidadeMax;
		energia = _dados.status.energia;
		energiaMax = _dados.status.energiaMax;
		energiaRec = _dados.status.energiaRec;
		energiaCons = _dados.status.energiaCons;
	}
	if (variable_instance_exists(_dados, "dropsAtracao")) {
		dropsAtracao = _dados.dropsAtracao;
	}
}
#endregion