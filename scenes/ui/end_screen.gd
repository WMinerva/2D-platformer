extends Control

@onready var return_button: Button = $PanelContainer/MarginContainer/VBoxContainer/Return_button
@onready var congratulation: Label = $PanelContainer/MarginContainer/VBoxContainer/Congratulation

func _ready() -> void:
	return_button.grab_focus()
	if GameManager.lives == 0:
		congratulation.text = "Game over"
	else:
		congratulation.text = "Congratulations!"


func _on_return_pressed() -> void:
	GameManager.restart_game()
