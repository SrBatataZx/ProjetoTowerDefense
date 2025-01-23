enum I_ESTADO{
	PARADO,
	ANDANDO,
	EXPLODIR,
	ATIRAR
}
function atualiza_i_estado(_inimigo){
	switch(estado){
		case I_ESTADO.PARADO:
			estado_txt = "parado"
			velh = 0
			velv = 0
			vel = 0
				if(distance_to_object(oCasa) >= 500){
					estado = I_ESTADO.ANDANDO;
				}
				if(distance_to_object(oCasa) <= 400 && _inimigo == oAtirador){
					estado = I_ESTADO.ATIRAR;
				}
		break;
		case I_ESTADO.ANDANDO:
			estado_txt = "andando"
			if(parar = true){
				if(distance_to_object(oCasa) <= 400 && _inimigo == oAtirador){
					estado = I_ESTADO.PARADO;
				}
				if(distance_to_object(oCasa) <= 300){
					estado = I_ESTADO.PARADO;
				}
			}
			if(distance_to_object(oCasa) == 0 && _inimigo == oBombardeiro){
				estado = I_ESTADO.EXPLODIR;
			}
			focox = oCasa.x
			focoy = oCasa.y
			var _dir = point_direction(x,y,focox,focoy)
			velh = lengthdir_x(vel, _dir)
			velv = lengthdir_y(vel, _dir)
		break;
		case I_ESTADO.EXPLODIR:
			estado_txt = "explodir"
			dano_casa()
		break;
		case I_ESTADO.ATIRAR:
			estado_txt = "atirando"
			if(alarm[0] == -1){
				atirar()
				alarm[0] = random_range(1,2) * game_get_speed(gamespeed_fps)
			}
			//instance_create_layer(x,y,"tiro",oTiro)
	}
}

function atirar(){
	var _tiro = instance_create_layer(x,y,"tiro",oTiro)
}

function tiro_move(){
	var focox = oCasa.x
	var focoy = oCasa.y
	var _dir = point_direction(x,y,focox,focoy)
	velh = lengthdir_x(vel, _dir)
	velv = lengthdir_y(vel, _dir)

	x += velh;
	y += velv;
}


#region status do inimigo
function status_inimigo(tipo_inimigo, nivel){
//script para puxar o dado do inimigo pelo nome, modo de inserir: crie um objeto do inimigo;
//no evento create voce irá puxar status_inimigo()
//após puxar voce irá alterar o nome dentro dos parenteses ("bombardeiro"), no meu arquivo json de status tenho
//bombardeiro, atirador e mágico, qualquer outro que não existir no arquivo json irá dar problema.
	// Buscar dados do inimigo
	var _inimigo_data = get_inimigo_data(tipo_inimigo);
	if (_inimigo_data == noone) return;
	
	// Buscar multiplicadores de nível
	var _multiplicador_data = get_multiplicador_data(nivel);
	if (_multiplicador_data == noone) return;
	// Atualizar os status do inimigo com base no JSON
	vida = _inimigo_data.status.vida;
	dano = _inimigo_data.status.dano * _multiplicador_data.status_mult.dano;
	vel = _inimigo_data.status.velo * _multiplicador_data.status_mult.velo;
}

function get_inimigo_data(tipo_inimigo){
	var _json_string = file_text_open_read("st_inimigo.json")
	var json_data = "";
	while (!file_text_eof(_json_string)) {
		json_data += file_text_readln(_json_string);
	}
	file_text_close(_json_string);
	var _inimigos = json_parse(json_data);
	if(_inimigos == undefined){
		show_error("Erro ao carregar o JSON de inimigos", true);
		return noone;
	}
	for (var i = 0; i < array_length(_inimigos.inimigos); i++) {
	    if (_inimigos.inimigos[i].funcao == tipo_inimigo) {
	        return _inimigos.inimigos[i];
	    }
	}
	show_error("Inimigo não encontrado no JSON: " + tipo_inimigo, true);
	return noone
}

function get_multiplicador_data(nivel){
	var _json_string = file_text_open_read("st_inimigo.json")
	var json_data = "";
	while (!file_text_eof(_json_string)) {
		json_data += file_text_readln(_json_string);
	}
	file_text_close(_json_string);
	var _multiplicadores = json_parse(json_data);
	if(_multiplicadores == undefined){
		show_error("Erro ao carregar o JSON de multiplicadores", true);
		return noone;
	}
	for (var i = 0; i < array_length(_multiplicadores.multiplicadores); i++) {
	    if (_multiplicadores.multiplicadores[i].nivel == nivel) {
	        return _multiplicadores.multiplicadores[i];
	    }
	}
	show_error("Nivel não encontrado no JSON: " + nivel, true);
	return noone
}
#endregion

#region
function dano_casa(){
	if(distance_to_object(oCasa) == 0){
		oCasa.vida -= dano
		instance_destroy(self)
	}
	//travando a vida da casa em 0.
	if(oCasa.vida < 0) oCasa.vida = 0
}
#endregion