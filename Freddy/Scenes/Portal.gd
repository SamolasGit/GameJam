extends Area2D

var Fase1 = "res://Scenes/Fase_1.tscn"
var Fase2 = "res://Scenes/Fase_2.tscn"
var Fase3 = "res://Scenes/Fase_3.tscn"
var Fase4 = "res://Scenes/Fase_4.tscn"
var Fase5 = "res://Scenes/Fase_5.tscn"
var Win = "res://Scenes/Win.tscn"

func _on_body_entered(body):
	if body.is_in_group("Player"):
		if get_parent().name == "Fase1":
			get_tree().change_scene_to_file(Fase2)
		elif get_parent().name == "Fase2":
			get_tree().change_scene_to_file(Fase3)
		elif get_parent().name == "Fase3":
			get_tree().change_scene_to_file(Fase4)
		elif get_parent().name == "Fase4":
			get_tree().change_scene_to_file(Fase5)
		elif get_parent().name == "Fase5":
			get_tree().change_scene_to_file(Win)

