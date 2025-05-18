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
		
		if (_dist < 100) {
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
	#endregion
}
Script23()

