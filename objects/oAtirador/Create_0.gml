/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();
//puxando status do inimigo, escolho qual inimigo e qual o nivel dele
statusInimigo("atirador","nivel_1")

#region mexendo com o timer do tiro
//Inicializa o contador de tempo para os tiros
tiro_timer = 0;
// Intervalo aleatório entre 1 e 2 segundos, convertido para frames
tiro_intervalo = irandom_range(1, 2) * game_get_speed(gamespeed_fps);
// Variáveis da barra de timer
barra_largura = 50; // Largura da barra
barra_altura = 5; // Altura da barra
barra_cor_fundo = c_gray; // Cor de fundo da barra
barra_cor_progresso = c_red; // Cor do progresso da barra
#endregion