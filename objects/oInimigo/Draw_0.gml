/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
//draw_self()
if(global.debug = true){
	draw_set_valign(1)
	draw_set_halign(1)
	var _circle_1 = draw_circle_color(x,y,850,c_blue,c_blue, true)
	var _circle_2 = draw_circle_color(x,y,500,c_green,c_green, true)
	var _circle_3 = draw_circle_color(x,y,200,c_red,c_red, true)
	draw_text(x - 60,y,distance_to_object(oCasa))
	draw_set_valign(-1)
	draw_set_halign(-1)
}
