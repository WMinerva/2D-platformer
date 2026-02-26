extends Enemy

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if not player:
		return
	flip()
	follow_player()
	
func flip():
	animated_sprite_2d.flip_h = player.position.x > position.x

func follow_player():
	var direction = player.position - position
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
