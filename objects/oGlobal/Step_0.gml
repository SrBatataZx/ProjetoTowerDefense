/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
check_keypresses();
if(instance_exists(oCasa)){
	if(oCasa.vida == 0){
		game_over()
		global.pause = true
	}
}