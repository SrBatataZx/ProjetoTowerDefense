///// @function					getPlayerArmaData(_arma)
///// @param {string}	_arma		Parameto que será puxado do arquivo json
///// @returns {struct}	Retorna struct com dados da arma ou noone se não encontrado
///// @description Função auxiliar para statusPlayerArma, responsável por ler os dados do json e puxar os status da armasData
//function getPlayerArmaData(_arma) {
//    var _armasData = loadJsonData("armas").armasData;
    
//    // Verifica se o inimigo existe no objeto
//    if (variable_struct_exists(_armasData, _arma)) {
//        return _armasData[$ _arma];
//    }
    
//    show_error("Inimigo não encontrado no JSON: " + _arma, true);
//    return {};
//}

///// @function			statusPlayerArma(_arma)
///// @param {string}		_arma
///// @description Aplica o status da arma ao player (script chamado no projétil da arma)
//function statusPlayerArma(_arma){
//	var _dados = getPlayerArmaData(_arma);
//	if (_dados == noone || !is_struct(_dados.status)) return;
//	dano = _dados.status.raridade.normal.dano;
//	velocidade = _dados.status.raridade.normal.velocidade;
//	tempoRecarga = _dados.status.raridade.normal.tempoRecarga;
//}




//LEGADO
///// @function				getPlayerData(_player)
///// @returns {struct}		Retorna struct com dados do player ou noone se não encontrado
///// @description Função auxiliar para statusPlayer, responsável por ler os dados do json e puxar os status da playerData;
//function getPlayerData() {
//    var dados = loadJsonData("status");
//    if (is_struct(dados) && is_struct(dados.entidades) && is_struct(dados.entidades.player)) {
//        return dados.entidades.player;
//    }
//    return {};
//}

///// @function			statusPlayer(_player)
///// @description Aplica o status geral do player (ex: velocidade)
//function statusPlayer(){
//	var _dados = getPlayerData();
//	if (_dados == noone || !is_struct(_dados.status)) return;
//	velocidade = _dados.status.velocidade;
//	velocidadeMax = _dados.status.velocidadeMax;
//	energia = _dados.status.energia;
//	energiaMax = _dados.status.energiaMax;
//	energiaRec = _dados.status.energiaRec;
//	energiaCons = _dados.status.energiaCons;
//	dropsAtracao = _dados.dropsAtracao;
//}