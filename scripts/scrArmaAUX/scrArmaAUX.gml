/// @function							criaTiro(_tiro,_sprite)
/// @param {Asset.GMObject} _tiro		objeto que servirá como projétil
/// @param {Asset.GMSprite} _sprite		sprite que o objeto projétil irá receber
/// @description função auxiliar para o sistema disparo de projétil

function criaTiro(_tiro, _sprite){
	//var _dir = point_direction(x,y,mouse_x,mouse_y);
	var tiro = instance_create_depth(x,y, 1,_tiro);//instance_create_layer(x,y,"tiro",tiro)
	tiro.speed = _tiro.velocidade;
	tiro.direction = mouseDir;
	timerTiro = _tiro.tempoRecarga;
	tiro.sprite_index = _sprite;
	tiro.image_angle = mouseDir - 90;
}

function disparo(tiro,sprite){
	var _mb_left = mouse_check_button(mb_left);
	var tiroLivre = !global.pause && _mb_left && timerTiro <= 0;
	timerTiro--;
	if(tiroLivre){
		criaTiro(tiro,sprite);
	}
}
//função para realizar a colisão e dano ao inimigo.
//o projétil ao colidir com o inimigo ou com a parede (oColisao) irá ser destruido
function tiroColisao(){
	if(place_meeting(x,y,oColisao)){
		instance_destroy(self.id)
	}
	//var inimigos = [oAtirador, oBombardeiro, oMago]
	
	for (var i = 0; i < array_length(inimigosColisao); i++){
		
		var inimigo = inimigosColisao[i];
		var instanciaInimigo = instance_place(x,y,inimigo);
		if(instanciaInimigo != noone){
			instanciaInimigo.vida -= dano // dano leva em consideraçao o status do script statusPlayer
			instance_destroy(self.id);
			if(instanciaInimigo.vida <= 0){
				oPlayer.inimigosMortos +=1
				global.inimigosMortos +=1;
				var _moedasMin = real(instanciaInimigo.moedasMin);
				var _moedasMax = real(instanciaInimigo.moedasMax);
				var _moedas = irandom_range(_moedasMin,_moedasMax)
				for (var j = 0; j<_moedas; j++){
					var inst = instance_create_layer(x,y,"animados",oMoeda);
					inst.speed = random_range(2, 5);
					inst.direction = random(360);
				}
				//show_debug_message("Foram criadas: " + string(_moedas) + " moedas");
				instance_destroy(instanciaInimigo);
			}
			break;
		}
	}
}