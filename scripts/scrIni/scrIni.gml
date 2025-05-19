function salvarConfig(_string_salvar,_quer_salvar){
	ini_open("config.ini");
	if(is_string(_quer_salvar)){
		ini_write_string("config", _string_salvar, _quer_salvar); //salvando strings
	} else if (is_real(_quer_salvar) || is_bool(_quer_salvar)){
		ini_write_real("config", _string_salvar, _quer_salvar); //salvado numeros ou booleanos
	}
	ini_close();
}
function carregarConfig(_string_carregar, _valor_padrao){
	var valor_carregado = _valor_padrao
	if(file_exists("config.ini")){
		ini_open("config.ini");
		if(is_string(_valor_padrao)){
			valor_carregado = ini_read_string("config",_string_carregar,_valor_padrao) //carregando strings
		} else if(is_real(_valor_padrao) || is_bool(_valor_padrao)){
				valor_carregado = ini_read_real("config",_string_carregar,_valor_padrao) //carregando numeros ou booleanos
		}
		ini_close()
	} else {
		salvarConfig(_string_carregar,_valor_padrao)
	}
	return valor_carregado // retorna o valor carregado ou o valor padrao
}
function salvarDados(_string_salvar,_quer_salvar){
	ini_open("dados.ini");
	if(is_string(_quer_salvar)){
		ini_write_string("dados", _string_salvar, _quer_salvar); //salvando strings
	} else if (is_real(_quer_salvar) || is_bool(_quer_salvar)){
		ini_write_real("dados", _string_salvar, _quer_salvar); //salvado numeros ou booleanos
	}
	ini_close();
}
function carregarDados(_string_carregar, _valor_padrao){
	var valor_carregado = _valor_padrao
	if(file_exists("dados.ini")){
		ini_open("dados.ini");
		if(is_string(_valor_padrao)){
			valor_carregado = ini_read_string("dados",_string_carregar,_valor_padrao) //carregando strings
		} else if(is_real(_valor_padrao) || is_bool(_valor_padrao)){
				valor_carregado = ini_read_real("dados",_string_carregar,_valor_padrao) //carregando numeros ou booleanos
		}
		ini_close()
	} else {
		salvarDados(_string_carregar,_valor_padrao)
	}
	return valor_carregado // retorna o valor carregado ou o valor padrao
}