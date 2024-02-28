extends StaticBody2D
@onready var _collision: CollisionShape2D = $CollisionShape2D
@onready var _sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	EventBus.sem_pneus.connect(_abrir)

func _abrir():
	#Desativa a colisão
	_collision.disabled = true
	#Enquanto não há um sprite da porta aberta, muda apenas a escala dela
	_sprite.scale.x = 0.383
