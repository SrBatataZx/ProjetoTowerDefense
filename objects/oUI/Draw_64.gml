/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!global.pause) {
    var margem_topo = 10;
    var margem_direita = -180;
	var margem_esquerda = 10
    
    var largura_sprite = sprite_get_width(sMortes);
    var altura_sprite = sprite_get_height(sMortes);
    var x_base = display_get_gui_width() - margem_direita;
    var y_base = margem_topo;
    draw_sprite(sMortes, 0, x_base - largura_sprite, y_base);
    draw_sprite(sDinheiro, 0, x_base - largura_sprite, y_base + altura_sprite + 10);
	draw_sprite(sVida,0, margem_esquerda, y_base);
	draw_sprite(sEnergia,0, margem_esquerda, y_base + altura_sprite + 10);

	var barraEnergia = sEnergiaBarra
	var energia_max = oPlayer.energiaMax;
	var energia_atual = oPlayer.energia;
	var vida_max = oEstrutura.vidaMax;
	var vida_atual = oEstrutura.vida;
	var largura_total = sprite_get_width(barraEnergia)
	var altura_barra = sprite_get_height(barraEnergia);

	var larguraBarraEnergia = (energia_atual / energia_max) * largura_total;
	var larguraBarraVida = (vida_atual / vida_max) * largura_total;
	draw_sprite_part(barraEnergia, 0, 0, 0, larguraBarraEnergia, altura_barra, margem_esquerda + 65, y_base + altura_sprite + 26);
	draw_sprite_part(sVidaBarra, 0, 0, 0, larguraBarraVida, altura_barra, margem_esquerda + 65, y_base + 16);
	
	
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_numeros)
	var _strMortes = string(oPlayer.inimigosMortos)
	var _strMoedas = string(oPlayer.moedas)
	draw_text(x_base - largura_sprite - 120, y_base + 15,_strMortes)
	draw_text(x_base - largura_sprite - 120, y_base + altura_sprite + 25,_strMoedas)
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1)
}
