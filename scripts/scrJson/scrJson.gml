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
		case "inimigos":
			if(global.inimigosData == noone){
				var _json_string = file_text_open_read("inimigos.json");
				var json_data = "";
				while (!file_text_eof(_json_string)){
					json_data += file_text_readln(_json_string);
				}
				file_text_close(_json_string);
				global.inimigosData = json_parse(json_data);
				if(global.inimigosData == undefined){
					show_error("Erro ao carregar o JSON", true);
				}
			}
		return global.inimigosData;
		case "armas":
			if(global.armasData == noone){
				var _json_string = file_text_open_read("armas.json");
				var json_data = "";
				while (!file_text_eof(_json_string)){
					json_data += file_text_readln(_json_string);
				}
				file_text_close(_json_string);
				global.armasData = json_parse(json_data);
				if(global.armasData == undefined){
					show_error("Erro ao carregar o JSON", true);
				}
			}
		return global.armasData;
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