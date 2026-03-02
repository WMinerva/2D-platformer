extends AnimatableBody2D
@export var target: Marker2D
@export var duration:float = 2

var tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tween = get_tree().create_tween()
	var start_position = position
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self,"position",target.global_position ,duration)
	tween.tween_property(self,"position",start_position,duration)
	tween.set_loops()
	


func _on_tree_exited() -> void:
	tween.kill()
