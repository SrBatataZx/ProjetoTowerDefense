/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//mouseColisao(sndwoodblock);
//checaBotaoObjeto();
checarMouse(sndwoodblock)

switch(botaoFuncao){
	case "fullscreen":
		if(global.fullscreen == 1){
			image_index = 2
			if(position_meeting(mouse_x, mouse_y, self.id)){
				image_index = 3
			}
		}
	break;
	case "acessibilidade":
		if(global.acessibilidade == 1){
			image_index = 2
			if(position_meeting(mouse_x, mouse_y, self.id)){
				image_index = 3
			}
		}
	break;
}