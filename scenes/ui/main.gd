extends Control

@onready var start: Button = $VBoxContainer/Start

func _ready() -> void:
	start.grab_focus()

func _on_start_pressed() -> void:
	GameManager.load_next_level()
