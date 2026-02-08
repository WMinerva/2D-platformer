extends CharacterBody2D

@export var speed: int
@export var jump_speed: int
@export var gravity : int
var is_facing_right = true


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_speed
	if not is_on_floor():
		velocity.y += gravity * delta
	
	move_x()
	flip()
	move_and_slide()


func flip():
	if (is_facing_right and velocity.x < 0) or (not is_facing_right and velocity.x > 0):
		scale.x *= -1
		is_facing_right = not is_facing_right


func move_x():
	var input_axis = Input.get_axis("left", "right")
	velocity.x = input_axis * speed
