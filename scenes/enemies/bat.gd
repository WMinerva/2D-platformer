extends Enemy

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	flip()
	
func flip():
	animated_sprite_2d.flip_h = player.position.x > position.x
