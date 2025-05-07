function criaTiro(tiro, sprite){
	var _dir = point_direction(x,y,mouse_x,mouse_y);
	var _tiro = instance_create_depth(x,y, 1,tiro)//instance_create_layer(x,y,"tiro",tiro)
	_tiro.speed = tiro.velocidade;
	_tiro.direction = _dir
	timer_tiro = tiro.tempo_recarga
	_tiro.sprite_index = sprite
	_tiro.image_angle = _dir - 90
}

function disparo(tiro,sprite){
	var _mb_left = mouse_check_button(mb_left)
	var tiroLivre = !global.pause && _mb_left && timer_tiro <= 0
	timer_tiro--;
	if(tiroLivre){
		criaTiro(tiro,sprite)
	}
}
//função para realizar a colisão e dano ao inimigo.
//o projétil ao colidir com o inimigo ou com a parede (oColisao) irá ser destruido
function tiroColisao(){
	if(place_meeting(x,y,oColisao)){
		instance_destroy(self.id)
	}
	var inimigos = [oAtirador, oBombardeiro]
	
	for (var i = 0; i < array_length(inimigos); i++){
		
		var inimigo = inimigos[i];
		var instanciaInimigo = instance_place(x,y,inimigo);
		
		if(instanciaInimigo != noone){
			instanciaInimigo.vida -= dano // dano leva em consideraçao o status do script statusPlayer
			instance_destroy(self.id);
			if(instanciaInimigo.vida <= 0){
				instance_destroy(instanciaInimigo);
			}
			break;
		}
	}
}