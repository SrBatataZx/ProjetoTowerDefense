/// @function							disparo(_tiro, _sprite)
/// @param {Asset.GMObject} _tiro		Objeto que será instanciado como projétil
/// @param {Asset.GMSprite} _sprite		Sprite que o projétil irá receber
/// @description Verifica disparo e instancia o projétil com atributos definidos

/// @function							disparoComTiro(_tiro, _sprite)
/// @param {Asset.GMObject} _tiro		Objeto que será instanciado como projétil
/// @param {Asset.GMSprite} _sprite		Sprite que o projétil irá receber
/// @description Verifica disparo e instancia o projétil com atributos definidos. Se o sprite tiver múltiplos frames, escolhe um aleatório.

function disparo(_tiro, _sprite) {
	var _mb_left = mouse_check_button(mb_left);
	var tiroLivre = !global.pause && _mb_left && timerTiro <= 0;
	timerTiro--;

	if (tiroLivre) {
		var tiro = instance_create_depth(x, y, 1, _tiro);
		tiro.speed        = _tiro.velocidade;
		tiro.direction    = mouseDir;
		timerTiro         = _tiro.tempoRecarga;
		tiro.sprite_index = _sprite;
		tiro.image_angle  = mouseDir - 90;

		// Se o sprite tiver mais de 2 frames, escolhe um aleatório
		//if (sprite_get_number(_sprite) > 1) {
		//	tiro.image_index = irandom(sprite_get_number(_sprite) - 1);
		//	//tiro.image_angle  = mouseDir - 50;
		//}
		teste(tiro, _sprite);
	}
}
function teste(_tiroInstance, _spriteIndex) {
    if (oPlayer.arma == oCaderno && sprite_get_number(_spriteIndex) > 1) {
        var chance = 0.1; // Pode ajustar isso depois se quiser
        
        _tiroInstance.image_index = (random(1) < chance) ? 1 : 0;
        
        if (_tiroInstance.image_index == 1) {
            _tiroInstance.dano = 10;
            _tiroInstance.image_angle = mouseDir - 50;
        }
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