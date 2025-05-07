/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
global.debug = false;
global.pause = false;
global.PauseMenu = false;

// Variável global para armazenar os dados do JSON
global.json_data = noone;

global.fullscreen = carregarConfig("FullScreen",1);
window_set_fullscreen(global.fullscreen);

global.audioGeral = 1
global.sfx = carregarConfig("SFX_Volume", 1)

global.language = carregarConfig("linguagem", "pt_br")

//global para verificar se mb_left foi pressionado utilizado em checa_click()
global.click_processed = false;

selecionaRoom(rMenu)
//rooms = [rJogo,rMapa1]

#macro DISCORD_APP_ID "1257094632232194118"

ready = false;

alarm[0] = game_get_speed(gamespeed_fps) * 5;

if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
	show_error("NekoPresence init fail.", true);
}