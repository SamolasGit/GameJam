extends CharacterBody2D

const SPEED = 100
const JUMP_VELOCITY = -400.0
var gravity = 980
var dir = 1

func _physics_process(delta):
	if is_on_wall():
		dir *= -1
	velocity.x = dir * SPEED
	if !is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
