//funcao auxiliar responsavel por setar velh e velv do player de acordo com a _max_vel
function atualizaVelocidade(_dir_h, _dir_v, _max_vel){
	var _dir = point_direction(0,0,_dir_h,_dir_v);
	velh = lengthdir_x(_max_vel,_dir);
	velv = lengthdir_y(_max_vel,_dir);
}
function restauraEnergia(factor = 1){
	if(energia < energia_max){
		energia += energia_rec * factor;
		if(energia > energia_max){
			energia = energia_max
		}
	}
}