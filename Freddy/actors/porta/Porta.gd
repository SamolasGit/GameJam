extends StaticBody2D
@onready var collision: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	EventBus.sem_pneus.connect(abrir)

func abrir():
	collision.disabled = true
	print_debug("Porta aberta")
