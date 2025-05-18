function danoCasa(){
	if(distance_to_object(oEstrutura) == 0){
		oEstrutura.vida -= dano
		instance_destroy(self.id)
	}
	//travando a vida da casa em 0.
	if(oEstrutura.vida < 0) oEstrutura.vida = 0
}