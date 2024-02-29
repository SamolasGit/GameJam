extends CharacterBody2D
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

func die():
	animation.play("Death")

func end_animation() -> void:
	EventBus.pneu_furado.emit()
	queue_free()
