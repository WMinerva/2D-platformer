extends Area2D

@export var points: int

func _on_area_entered(area: Area2D) -> void:
	GameManager.update_score(points)
	queue_free()
