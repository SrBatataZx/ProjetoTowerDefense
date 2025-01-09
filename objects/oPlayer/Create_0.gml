/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
estado = P_ESTADO.PARADO;
estado_txt = "parado";

energia = 100;
energia_max = 100;
energia_rec = .5;
energia_cons = .3;

keyboard_set_map(ord("W"),vk_up);
keyboard_set_map(ord("S"),vk_down);
keyboard_set_map(ord("A"),vk_left);
keyboard_set_map(ord("D"),vk_right);