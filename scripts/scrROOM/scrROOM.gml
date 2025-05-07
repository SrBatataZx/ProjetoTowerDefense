function selecionaRoom(_room_pick) {
	// Verifica se a sala atual é a mesma que a sala escolhida
	if (room != _room_pick) {
		return; // Sai da função se a sala não for a correta
	}
	// Verifica a sala escolhida e executa as ações correspondentes
	switch (_room_pick) {
		case rMenu:
			criaMenu("Inicio"); // Cria o menu inicial
		break;
		//case rConfiguracao:
		//	criaMenu("Configuracao"); // Cria o menu de configurações
		//break;
		case rJogo:
			if (oCasa.vida > 0) {
				checaTeclaPressionada(); // Verifica pressionamentos de tecla
			} else if (oCasa.vida == 0) {
				criaMenu("Morte"); // Cria o menu de morte
			}
		break;
	}
}