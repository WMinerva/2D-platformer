extends Control

@onready var return_button: Button = $PanelContainer/MarginContainer/VBoxContainer/Return_button
@onready var congratulation: Label = $PanelContainer/MarginContainer/VBoxContainer/Congratulation
@onready var score_label: Label = $PanelContainer/MarginContainer/VBoxContainer/ScoreLabel

func _ready() -> void:
	return_button.grab_focus()
	if GameManager.lives == 0:
		congratulation.text = "Game over"
	else:
		congratulation.text = "Congratulations!"
		
	score_label.text = "Your score: " + str(GameManager.score)


func _on_return_pressed() -> void:
	GameManager.restart_game()
