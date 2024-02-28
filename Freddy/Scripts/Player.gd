extends CharacterBody2D

@export var JumpCount = 3
@export var Speed = 200
@export var JumpVelocity = -500.0
var dir = 1
var gravity = 980
@onready var Animator: AnimatedSprite2D = $AnimatedSprite2D

signal pneu_furado

func _ready() -> void:
	pneu_furado.connect(EventBus.checar_pneus)

func _physics_process(delta):
	if is_on_wall():
		dir *= -1
		Animator.flip_h = !Animator.flip_h
	velocity.x = dir * Speed
	if is_on_floor():
		Animator.play("Walk")
		_jump()
	else:
		velocity.y += gravity * delta
		Animator.play("Jump")
	move_and_slide()

func _jump():
	if JumpCount == 0 or not Input.is_action_just_pressed("Jump"): return
	velocity.y += JumpVelocity
	JumpCount -= 1

func _on_area_2d_body_entered(body):
	if body.is_in_group("Killable"):
		body.queue_free()
		pneu_furado.emit()
	elif body.is_in_group("Spike"):
		queue_free()
