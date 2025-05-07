// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function substituirLinguagem(_acao){
	var languages = ["pt_br","en_us"]
	var _currentIndex = array_get_index(languages, global.language)
	switch(_acao){
		case "Avancar":
			_currentIndex++
			if(_currentIndex >= array_length(languages)){
				_currentIndex = 0;
			}
		break;
		case "Voltar":
			_currentIndex--;
			if(_currentIndex < 0){
				_currentIndex = array_length(languages) - 1;
			}
		break;
	}
	//salvando a configuraçao de linguagem
	global.language = languages[_currentIndex];
	salvarConfig("linguagem", global.language)
}

//funcão auxiliar para trocar corretamente as sprites durante a mudança de linguagem
function substituirSprite(_sprPT,_sprEN){
	var _sprite_index = [_sprPT, _sprEN];
	sprite_index = _sprite_index[0];
	switch(global.language){
		case "pt_br":
			sprite_index = _sprite_index[0];
		break;
		case "en_us":
			sprite_index = _sprite_index[1]
		break;
	}
}

function atualizaInterface(){
    var _objetos = [
		{ obj: oLinguagem, sprPT: spt_br, sprEN: sen_us},
		{ obj: oIniciar, sprPT: sIniciar, sprEN: sStart },
		{ obj: oAjustes, sprPT: sConfiguracao, sprEN: sSettings },
		{ obj: oSair, sprPT: sSair, sprEN: sLeave },
		{ obj: oVoltar, sprPT: sVoltar, sprEN: sBack },
		{ obj: oReiniciar, sprPT: sReiniciar, sprEN: sRestart }
    ];

    for (var i = 0; i < array_length(_objetos); i++) {
        with (_objetos[i].obj) {
            substituirSprite(_objetos[i].sprPT, _objetos[i].sprEN);
        }
    }
}