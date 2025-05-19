function selecionaRoom(_room_pick) {
	var salas = [];

	// Verifica se é array ou valor único
	if (is_array(_room_pick)) {
		salas = _room_pick;
	} else {
		salas = [_room_pick];
	}

	// Verifica se a sala atual está entre as salas passadas
	if (!array_contains(salas, room)) {
		return;
	}

	// Lógica por sala
	if (array_contains(salas, rMenu)) {
		menu("criaMenu", "Inicio");
	}
	
	if (array_contains(salas, rJogo) || array_contains(salas, rLobby)) {
		checaTeclaPressionada();
		if(instance_exists(oEstrutura)){
			if (oEstrutura.vida > 0) {
				global.morteMenu = false;
			} else if (oEstrutura.vida == 0 && !global.morteMenu) {
				if (!oEstrutura.recompensa_dada) {
					global.cristais += oPlayer.moedas / 2;
					oPlayer.cristais = oPlayer.moedas / 2;
					salvarDados("cristais", global.cristais);
					oEstrutura.recompensa_dada = true;
					//show_debug_message(string(oPlayer.moedas) + " Moedas convertidas para: " + string(oPlayer.cristais) + " Cristais")
			    }
				menu("criaMenu", "Morte");
				global.morteMenu = true;
			}
		}
	}
}
