extends Control


@onready var QuitButton = $Button2


func _on_button_button_down():
	get_tree().change_scene_to_file("res://Scenes/Fase_1.tscn")


func _on_button_2_button_down():
	get_tree().quit()	


