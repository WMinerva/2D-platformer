extends Node

const BIT_BIT_LOOP = preload("uid://d2gnxrgso1cyp")

const BUTTON_FOCUS = preload("uid://dpmvowvm3xptr")
const ENEMY_DIE = preload("uid://bsu53lrhrsyj2")
const JUMP = preload("uid://sb6mk3rcma87")
const PICKUP = preload("uid://khtdym8clqsq")
const PLAYER_DIE = preload("uid://d20238s8h7cgo")
const SUCCESS = preload("uid://cednh8keup4xn")

var is_sfx_active = true
var is_music_active = true

func toggle_sfx():
	is_sfx_active = not is_sfx_active
	
func toggle_music():
	is_music_active = not is_music_active


func play_sfx(audio_stream_player, sfx):
	if is_sfx_active:
		audio_stream_player.stream = sfx
		audio_stream_player.play()

func play_music(audio_stream_player, music):
	if is_music_active:
		audio_stream_player.stream = music
		audio_stream_player.play()
		
func restart_audio():
	is_sfx_active = true
	is_music_active = true
