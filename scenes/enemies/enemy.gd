class_name Enemy
extends CharacterBody2D

@export var speed: int
@export var gravity: int
@onready var hurt_box: Area2D = $HurtBox
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")


func _on_hurt_box_area_entered(area: Area2D) -> void:
	
	if player.position.y < hurt_box.global_position.y:
		animation_player.play("dissapear")
		set_physics_process(false)
		animated_sprite_2d.pause()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
