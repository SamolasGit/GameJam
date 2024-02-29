extends CharacterBody2D
class_name Player

var JumpCount = 3
const SPEED = 200
const JUMP_VELOCITY = -500.0
var dir = 1
var gravity = 980
@onready var Animator = $AnimatedSprite2D

signal pulou

func _ready() -> void:
	pulou.emit()

func _physics_process(delta):
	if is_on_wall(): 
		dir *= -1
		Animator.flip_h = !Animator.flip_h
	velocity.x = dir * SPEED
	if !is_on_floor():
		velocity.y += gravity * delta
		Animator.play("Jump")
	else:
		Animator.play("Walk")
		if Input.is_action_just_pressed("Jump") and JumpCount > 0:
			velocity.y += JUMP_VELOCITY 
			JumpCount -= 1
			pulou.emit()
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("Killable"):
		body.die()
	elif body.is_in_group("Spike"):
		queue_free()
