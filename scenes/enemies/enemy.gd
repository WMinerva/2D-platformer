class_name Enemy
extends CharacterBody2D

@export var speed: int
@export var gravity: int
@onready var hurt_box: Area2D = $HurtBox

var player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")


func _on_hurt_box_area_entered(area: Area2D) -> void:
	
	if player.position.y < hurt_box.global_position.y:
		queue_free()
