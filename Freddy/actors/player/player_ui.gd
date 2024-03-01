extends CanvasLayer

@onready var jumps: Label = $Control/margin/container/jumps
@onready var player: Player = get_parent()

func _ready() -> void:
	player.pulou.connect(jump_text)

func jump_text():
	jumps.text = str(player.JumpCount)
