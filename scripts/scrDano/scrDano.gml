function DanoCasa(){
	if(distance_to_object(oCasa) == 0){
		oCasa.vida -= dano
		instance_destroy(self)
	}
	//travando a vida da casa em 0.
	if(oCasa.vida < 0) oCasa.vida = 0
}
//funcao para dar dano no inimigo, ele irá considerar o dano da arma setado no arquivo json
//
function DanoInimigo(){
	TiroColisao();
	var inimigos = [oAtirador, oBombardeiro]
	
	for (var i = 0; i < array_length(inimigos); i++){
		
		var inimigo = inimigos[i];
		var instanciaInimigo = instance_place(x,y,inimigo);
		
		if(instanciaInimigo != noone){
			instanciaInimigo.vida -= dano // dano leva em consideraçao o status do script statusPlayerArma()
			instance_destroy(self);
			if(instanciaInimigo.vida <= 0){
				instance_destroy(instanciaInimigo);
			}
			break;
		};
	};
}