/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.debug){
	if(instance_exists(oGlobal)){
		draw_text(x,y, "objeto global existe")
	} else {
		draw_text(x,y, "objeto global nao existe")
	}
	draw_text(x,y,"objeto global existe")
	if(global.pause){
		draw_text(x,y + 20,"pausado")
	} else {
		draw_text(x,y + 20,"rodando")
	}
	if(instance_exists(oMenuPause)){
		draw_text(x,y + 40, "objeto menuP existe")
	} else {
		draw_text(x,y + 40, "objeto menuP nao existe")
	}
}

if(room = rMenu){
	if(instance_exists(oMenuInicio)){
		draw_text(x,y + 60, "objeto menuI existe")
	} else {
		draw_text(x,y + 60, "objeto menuI nao existe")
	}
}