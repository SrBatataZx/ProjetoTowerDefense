/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//var _rooms = [rJogo,rMapa1]
selecionaRoom(rJogo)
if(instance_exists(oEstrutura)){
	if(oEstrutura.vida == 0){
		global.pause = true
	}
	if(!global.pause){
		Script24()
	}
}

if(room == rJogo){
	if(!instance_exists(oUI)){
		instance_create_layer(x,y,"ui",oUI)
	}
}

np_update();