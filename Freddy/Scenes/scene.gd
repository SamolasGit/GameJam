extends Node2D

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("restart_game"):
		get_tree().reload_current_scene()
