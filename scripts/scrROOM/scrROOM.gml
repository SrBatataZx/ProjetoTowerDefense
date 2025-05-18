function selecionaRoom(_room_pick) {
	// Verifica se a sala atual é a mesma que a sala escolhida
	if (room != _room_pick) {
		return; // Sai da função se a sala não for a correta
	}
	// Verifica a sala escolhida e executa as ações correspondentes
	switch (_room_pick) {
		case rMenu:
			menu("criaMenu","Inicio"); // Cria o menu inicial
		break;
		case rJogo:
			if (oEstrutura.vida > 0) {
				checaTeclaPressionada(); // Verifica pressionamentos de tecla
				global.morteMenu = false;
			} else if (oEstrutura.vida == 0 && !global.morteMenu) {
				menu("criaMenu","Morte"); // Cria o menu de morte
				global.morteMenu = true;
			}
		break;
	}
}