extends CharacterBody2D

@onready var Animator = $AnimatedSprite2D
const SPEED = 55
const JUMP_VELOCITY = -400.0
var gravity = 980
var dir = 1

func _physics_process(delta):
	if is_on_wall():
		dir *= -1
		
		
	if dir > 0:
		Animator.play("SpikeTire")
	else:
		Animator.play_backwards("SpikeTire")
		
	velocity.x = dir * SPEED
	if !is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	

