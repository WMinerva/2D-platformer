extends Control

@onready var lives_label: Label = $MarginContainer/LivesLabel

func _ready() -> void:
	lives_label.text = "Lives: " + str(GameManager.lives)
