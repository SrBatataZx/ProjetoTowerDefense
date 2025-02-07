function globalAudio(_tipo,_acao){
	//verificando o tipo de audio
	switch(_tipo){
		case "sfx":
			switch(_acao){
				case "Diminuir":
					global.sfx = max(0, global.sfx - 0.1);
				break;
				case "Aumentar":
					global.sfx = min(1, global.sfx + 0.1);
				break;
			}
		//salvando a configuraçao de audio
		salvarConfig("SFX_Volume", global.sfx)
		break;
		//case "Geral":
		//break;
	}
}