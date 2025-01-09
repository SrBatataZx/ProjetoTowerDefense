/// @description colisao
if (place_meeting(x + velh, y, _colisao)){
	var _velh = sign(velh);
	while(!place_meeting(x + _velh, y, _colisao)){
		x += _velh
	}
	velh = 0;
}
x += round(velh);
if (place_meeting(x, y + velv, _colisao)){
	var _velv = sign(velv);
	while(!place_meeting(x, y + _velv, _colisao)){
		y += _velv
	}
	velv = 0;
}
y += round(velv);