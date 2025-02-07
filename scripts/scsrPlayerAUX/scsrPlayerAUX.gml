//funcao auxiliar responsavel por setar velh e velv do player de acordo com a _max_vel
function s_atualiza_speed(_dir_h, _dir_v, _max_vel){
	var _dir = point_direction(0,0,_dir_h,_dir_v);
	velh = lengthdir_x(_max_vel,_dir);
	velv = lengthdir_y(_max_vel,_dir);
}

function restore_energy(factor = 1){
	if(energia < energia_max){
		energia += energia_rec * factor;
		if(energia > energia_max){
			energia = energia_max
		}
	}
}

function ManipulaDisparo(_mb_left){
	timer_tiro--;
	if(_mb_left && timer_tiro <= 0){
		estado = P_ESTADO.ATIRANDO
	}
}
function PlayerTiro(){
	var _dir = point_direction(x,y,mouse_x,mouse_y);
	var _tiro = instance_create_layer(x,y,"tiro",oTiroPlayer)
	_tiro.speed = oTiroPlayer.vel;
	_tiro.direction = _dir
	timer_tiro = oTiroPlayer.cd
}

function TiroColisao(){
	if(place_meeting(x,y,oColisao)){
		instance_destroy(self)
	}
}