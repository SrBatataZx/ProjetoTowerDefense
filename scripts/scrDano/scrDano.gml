function danoCasa(){
	if(distance_to_object(oCasa) == 0){
		oCasa.vida -= dano
		instance_destroy(self.id)
	}
	//travando a vida da casa em 0.
	if(oCasa.vida < 0) oCasa.vida = 0
}