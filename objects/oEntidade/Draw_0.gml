/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self()

if(global.debug = true){
	draw_set_valign(1)
	draw_set_halign(1)
	draw_text(x, y - sprite_height, estado_txt)
	draw_set_valign(-1)
	draw_set_halign(-1)
}