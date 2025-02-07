function AtiraInimigo(){
	if(global.pause){
		return
	}
	if(oCasa.vida > 0){
		tiro_timer++;
		if(tiro_timer >= tiro_intervalo){
			var _tiro = instance_create_layer(x,y,"tiro",oTiroAtirador)
			tiro_timer = 0
			tiro_intervalo = irandom_range(1, 2) * game_get_speed(gamespeed_fps);
		}
	}
}

function TiroMove(){
	var focox = oCasa.x
	var focoy = oCasa.y
	var _dir = point_direction(x,y,focox,focoy)
	velh = lengthdir_x(vel, _dir)
	velv = lengthdir_y(vel, _dir)
	x += velh;
	y += velv;
}