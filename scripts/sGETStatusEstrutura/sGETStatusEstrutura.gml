// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function getEstruturaData(){
	var dados = loadJsonData("status").estruturaData;
	for (var i = 0; i < array_length(dados); i++){
		if (dados[i].estrutura == "estrutura"){
			return dados[i];
		}
	}
	return {}
}
function statusEstrutura(){
	var _dados = getEstruturaData();
	if (_dados == noone || !is_struct(_dados.status)) return;
	vida = _dados.status.vida;
	vidaMax = _dados.status.vidaMax;
}