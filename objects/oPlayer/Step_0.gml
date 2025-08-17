/// @description Inserir descrição aqui
// Você poade escrever seu código neste editor
if(!global.pause){
	playerStateMachine()
	#region mover para script
	//var moeda = instance_place(x,y,oMoeda);
	//if (moeda != noone) {
	//    instance_destroy(moeda);
	//    moedas += 1;
	//}
	with (oMoeda) {
		var _dist = point_distance(x, y, other.x, other.y);
		
		if (_dist < other.dropsAtracao) {
		    var _dir = point_direction(x, y, other.x, other.y);
		    var _vel = clamp(2 - _dist * 0.015, 0.5, 2);
		
		    x += lengthdir_x(_vel, _dir);
		    y += lengthdir_y(_vel, _dir);
		}
		if (place_meeting(x, y, other)) {
			other.moedas += 1;
			instance_destroy();
		}
	}
	// if (instance_exists(oEstrutura)) {
	//	 if (oEstrutura.vida <= 0 && !oEstrutura.recompensa_dada) {
	//		global.cristais += moedas / 2;
	//		//salvarDados("cristais", global.cristais);
	//		oEstrutura.recompensa_dada = true;
	//	}
	//}
	#endregion
}
selecionaArma()

