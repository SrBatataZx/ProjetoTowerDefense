// Os recursos de script mudaram para a v2.3.0; veja
//funcao para carregar o JSON apenas uma vez
function loadJsonData(_json){
	switch(_json){
		case "status":
			if(global.statusData == noone){
				var _json_string = file_text_open_read("status.json");
				var json_data = "";
				while (!file_text_eof(_json_string)){
					json_data += file_text_readln(_json_string);
				}
				file_text_close(_json_string);
				global.statusData = json_parse(json_data);
				if(global.statusData == undefined){
					show_error("Erro ao carregar o JSON", true);
				}
			}
		return global.statusData;
		case "spawn":
			if(global.rodadasData == noone){
				var _json_string = file_text_open_read("spawnInimigos.json");
				var json_data = "";
				while (!file_text_eof(_json_string)){
					json_data += file_text_readln(_json_string);
				}
				file_text_close(_json_string);
				global.rodadasData = json_parse(json_data);
				if(global.rodadasData == undefined){
					show_error("Erro ao carregar o JSON", true);
				}
			}
		return global.rodadasData;
	}
}