/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
estado = P_ESTADO.PARADO;
estado_txt = "parado";

arma = noone

//timer_tiro = 0;
inimigosMortos = 0;
moedas = 0

statusPlayer()

keyboard_set_map(ord("W"),vk_up);
keyboard_set_map(ord("S"),vk_down);
keyboard_set_map(ord("A"),vk_left);
keyboard_set_map(ord("D"),vk_right);

//Verificando a existencia do objeto player para criar o objeto camera
//ao inves de colocar o objeto camera direto na room, ele será criado com o player
//criar_objeto(oPlayer,"global",oCamera)
instance_create_layer(x,y,"global",oCamera)