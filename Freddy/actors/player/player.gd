extends CharacterBody2D
class_name Player
@onready var SoundPlayer = $AudioStreamPlayer2D
@export var JumpCount = 3
const SPEED = 55
const JUMP_VELOCITY = -280.0
var dir = 1
var gravity = 980
var gameStarted = false
@onready var Animator = $AnimatedSprite2D

signal pulou

func _ready() -> void:
	if get_parent().name == "Fase2":
		JumpCount = 4
	elif get_parent().name == "Fase1":
		JumpCount = 2
	elif get_parent().name == "Fase4":
		JumpCount = 5
	elif get_parent().name == "Fase5":
		JumpCount = 6
	pulou.emit()
 

func _physics_process(delta):
	if gameStarted:
		Engine.time_scale = 1
	else:
		Engine.time_scale = 0
		
	if Input.is_anything_pressed():
		gameStarted = true
	if Input.is_key_label_pressed(KEY_R):
		get_tree().reload_current_scene()
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
			if !SoundPlayer.playing: 
				SoundPlayer.play()
			velocity.y += JUMP_VELOCITY 
			JumpCount -= 1
			pulou.emit()
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("Killable"):
		body.die()
	elif body.is_in_group("Spike"):
		print(1)
		get_tree().reload_current_scene()


func _on_area_2d_area_entered(area):
	if area.is_in_group("Spike"):
		print(1)
		get_tree().reload_current_scene()

