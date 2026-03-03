extends Control

@onready var start: Button = $VBoxContainer/Start
@onready var high_score: Label = $VBoxContainer/HighScore

func _ready() -> void:
	start.grab_focus()
	high_score.text = "High score: " + str(GameManager.high_score)

func _on_start_pressed() -> void:
	GameManager.load_next_level()
