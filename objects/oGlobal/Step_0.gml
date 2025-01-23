/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
seleciona_room(rJogo)
seleciona_room(rMenu)
if(instance_exists(oCasa)){
	if(oCasa.vida == 0){
		global.pause = true
	}
}