/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

if (global.debug){
	draw_set_valign(1)
	draw_set_halign(1)
	draw_text(x, y + 45, "Energia: " + string(energia) + " / " + string(energia_max));
	draw_set_valign(-1)
	draw_set_halign(-1)
}
