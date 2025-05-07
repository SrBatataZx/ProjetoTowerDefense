// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Script23(){
	if(tipoTecla("pressed",(ord("1")))){
		instance_destroy(arma)
		arma = oCaderno
		instance_create_depth(x,y,199,arma)
	}
	if(tipoTecla("pressed",(ord("2")))){
		instance_destroy(arma)
		arma = oKitMedico
		instance_create_depth(x,y,199,arma)
	}
	if(tipoTecla("pressed",(ord("3")))){
		instance_destroy(arma)
		arma = oApagador
		instance_create_depth(x,y,199,arma)
	}
}