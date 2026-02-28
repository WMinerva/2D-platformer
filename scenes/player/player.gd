extends CharacterBody2D

@export var speed: int
@export var jump_speed: int
@export var gravity: int
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var is_facing_right = true


func _physics_process(delta: float) -> void:
	jump(delta)
	move_x()
	flip()
	move_and_slide()
	update_animations()


func update_animations():
	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
		return

	if velocity.x != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")


func jump(delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
	if not is_on_floor():
		velocity.y += gravity * delta


func flip():
	if (is_facing_right and velocity.x < 0) or (not is_facing_right and velocity.x > 0):
		scale.x *= -1
		is_facing_right = not is_facing_right


func move_x():
	var input_axis = Input.get_axis("left", "right")
	velocity.x = input_axis * speed


func _on_hurt_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("traps"):
		animation_player.play("player_death")
		set_physics_process(false)
		animated_sprite.pause()
		return 
	if position.y < area.global_position.y:
		velocity.y = -jump_speed
	else:
		animation_player.play("player_death")
		set_physics_process(false)
		animated_sprite.pause()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
