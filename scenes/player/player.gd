extends CharacterBody2D

@export var speed: int


func _physics_process(delta: float) -> void:
	move_x()
	move_and_slide()


func move_x():
	var input_axis = Input.get_axis("left", "right")
	velocity.x = input_axis * speed
