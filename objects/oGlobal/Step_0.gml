/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//var _rooms = [rJogo,rMapa1]
selecionaRoom(ROOMS)
if(instance_exists(oEstrutura)){
	if(oEstrutura.vida == 0){
		global.pause = true
	}
	if(!global.pause){
		ControlaSpawn()
	}
}

if(room == rJogo){
	if(!instance_exists(oUI)){
		instance_create_layer(x,y,"ui",oUI)
	}
}

np_update();