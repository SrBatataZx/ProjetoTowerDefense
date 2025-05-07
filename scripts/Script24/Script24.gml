// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Script24(){
	var inimigos = [oAtirador, oBombardeiro]
	//var _inimigo = array_length(inimigos)
	var _x = oCasa.x;
	var _y = oCasa.y;
	var _angulo = random_range(0,359);
	var _dist = random_range(850,990);
	var _xx = _x+lengthdir_x(_dist,_angulo);
	var _yy = _y+lengthdir_y(_dist,_angulo);
	
	var _inimigo = inimigos[irandom(array_length(inimigos)-1)];
	instance_create_depth(_xx,_yy,199,_inimigo);
}