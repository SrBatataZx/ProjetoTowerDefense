// Os recursos de script mudaram para a v2.3.0; veja
//funcao para carregar o JSON apenas uma vez
function load_json_data(){
	if(global.json_data == noone){
		var _json_string = file_text_open_read("status.json");
		var json_data = "";
		while (!file_text_eof(_json_string)){
			json_data += file_text_readln(_json_string);
		}
		file_text_close(_json_string);
		global.json_data = json_parse(json_data);
		if(global.json_data == undefined){
			show_error("Erro ao carregar o JSON", true);
		}
	}
	return global.json_data;
}