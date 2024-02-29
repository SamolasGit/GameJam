extends AnimatedSprite2D


func die():
	play("Death")
func _on_animation_finished():
	queue_free()
