/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//var _rooms = [rJogo,rMapa1]
selecionaRoom(rJogo)
if(instance_exists(oCasa)){
	if(oCasa.vida == 0){
		global.pause = true
	}
	if(!global.pause){
		//Script24()
	}
}


np_update();