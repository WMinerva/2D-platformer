extends Control

@onready var start: Button = $VBoxContainer/Start
@onready var high_score: Label = $VBoxContainer/HighScore
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var sfx: Button = $VBoxContainer/SFX
@onready var music: Button = $VBoxContainer/Music

func _ready() -> void:
	AudioManager.restart_audio()
	start.grab_focus()
	high_score.text = "High score: " + str(GameManager.high_score)

func _on_start_pressed() -> void:
	GameManager.load_next_level()
	


func _on_focus_entered() -> void:
	AudioManager.play_sfx(audio_stream_player, AudioManager.BUTTON_FOCUS)


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_sfx_pressed() -> void:
	AudioManager.toggle_sfx()
	if AudioManager.is_sfx_active:
		sfx.text = "sfx: on"
	else :
		sfx.text = "sfx: off"


func _on_music_pressed() -> void:
	AudioManager.toggle_music()
	if AudioManager.is_music_active:
		music.text = "music: on"
	else :
		music.text = "music: off"
	
