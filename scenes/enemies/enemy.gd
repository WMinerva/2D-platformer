class_name Enemy
extends CharacterBody2D

@export var speed: int
@export var gravity: int
var player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")


func _on_hurt_box_area_entered(area: Area2D) -> void:
	queue_free()
