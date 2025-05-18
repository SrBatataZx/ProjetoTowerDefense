/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _dispercao = random_range(10,100)
if (point_distance(x_origin, y_origin, x, y) >= _dispercao) {
    speed = 0;
}
//if(!global.pause){
//	var _alvo = instance_nearest(x,y, oPlayer);
//	if(_alvo != noone){
//		var _dist = point_distance(x,y,_alvo.x,_alvo.y);
//		if(_dist < oPlayer.dropsAtracao){
//			var _dir = point_direction(x,y,_alvo.x,_alvo.y);
//			var _vel = clamp(2 - _dist * 0.015, 2, 2);
//			x += lengthdir_x(_vel, _dir);
//			y += lengthdir_y(_vel, _dir);
//		}
//	}
//}