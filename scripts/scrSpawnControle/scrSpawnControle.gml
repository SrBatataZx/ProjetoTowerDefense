function Script24() {
	var spawnData = loadJsonData("spawn");
	var listaInimigos = spawnData.inimigos;
	var qtdMax = spawnData.qtdMax;
	
	var chances = [];
	var totalPeso = 0;
	var totalExistentes = 0;
	
	for (var i = 0; i < array_length(listaInimigos); i++) {
		var nome = listaInimigos[i].nome;
		var peso = listaInimigos[i].peso;
		var obj = stringParaObjeto(nome);
		
		var existentes = instance_number(obj);
		array_push(chances, {
			nome: nome, //criado apenas para debug
			objeto: obj,
			peso: peso,
			existentes: existentes
		});
		totalPeso += peso;
	}

	for (var i = 0; i < array_length(chances); i++) {
		totalExistentes += chances[i].existentes;
	}

	var faltamSpawnar = qtdMax - totalExistentes;
	if (faltamSpawnar <= 0) return;
	var _x = oEstrutura.x;
	var _y = oEstrutura.y;
	for (var i = 0; i < faltamSpawnar; i++) {
		var escolha = irandom_range(1, totalPeso);
		var acumulado = 0;
		var obj = noone;
		var nomeInimigo = ""; //criado apenas para debug

		for (var j = 0; j < array_length(chances); j++) {
			acumulado += chances[j].peso;
			if (escolha <= acumulado) {
				obj = chances[j].objeto;
				nomeInimigo = chances[j].nome; //criado apenas para debug
				break;
			}
		}

		if (obj != oInimigoPai) {
			
			var _angulo = random(360);
			var _dist = random_range(850, 990);
			var _xx = _x + lengthdir_x(_dist, _angulo);
			var _yy = _y + lengthdir_y(_dist, _angulo);
			instance_create_layer(_xx, _yy, "animados", obj);
			//criado apenas para debug
			show_debug_message("Inimigo " + nomeInimigo + " criado em (" + string(_xx) + ", " + string(_yy) + ")");
		}
	}
}

function stringParaObjeto(_nome){
	var nome = _nome;

	switch (nome) {
	    case "atirador": return oAtirador;
	    case "bombardeiro": return oBombardeiro;
		case "mago": return oMago;
	    default:
	        show_error("Tipo de inimigo desconhecido: " + string(nome), true);
	        return oInimigoPai;
	}
}

//function Script24(){
//	var dados = loadJsonData("spawn");
//	var lista = dados.inimigos;
	
//	for (var i = 0; i < array_length(lista); i++) {
//		var nome = lista[i].nome;
//		var qtd = lista[i].quantidade;
//		var obj = string_para_objeto(nome)
		
//		var existentes = instance_number(obj);
//		var faltam = qtd - existentes;
		
//		if (faltam > 0){
//			for(var j=0;j<faltam;j++){
//			    var _x = oCasa.x;
//			    var _y = oCasa.y;
//			    var _angulo = random_range(0, 359);
//			    var _dist = random_range(850, 990);
//			    var _xx = _x + lengthdir_x(_dist, _angulo);
//			    var _yy = _y + lengthdir_y(_dist, _angulo);
	
//			    instance_create_depth(_xx, _yy, 199, obj);
//			}
//		}
//	}
//}
