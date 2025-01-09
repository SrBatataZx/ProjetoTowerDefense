/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

if (global.debug = true){
	draw_set_valign(1)
	draw_set_halign(1)
	draw_text(x, y + 25, "x: " + string(velh))
	draw_text(x, y + 35, "y: " + string(velv))
	draw_text(x, y + 45, "Energia: " + string(energia) + " / " + string(energia_max));
	draw_text(x + 60,y,distance_to_object(oCasa))
	draw_set_valign(-1)
	draw_set_halign(-1)
}
