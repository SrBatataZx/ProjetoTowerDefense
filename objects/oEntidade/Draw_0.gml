/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self()

if(global.debug){
	draw_set_valign(1)
	draw_set_halign(1)
	draw_text(x, y - sprite_height, estado_txt)
	draw_text(x - 30,y,vel)
	draw_text(x, y + 25, "x: " + string(velh))
	draw_text(x, y + 35, "y: " + string(velv))
	draw_text(x + 30,y,distance_to_object(oCasa))
	draw_set_valign(-1)
	draw_set_halign(-1)
}