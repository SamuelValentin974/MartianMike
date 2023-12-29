extends CharacterBody2D
class_name Player

@onready var _spr = $AnimatedSprite2D

@export var _gravity = 400
var _jumpForce = 200;
var _dir = 0
var _speed = 125
var _active = true

func _physics_process(delta):
	if !is_on_floor() && velocity.y < 500:
		velocity.y += _gravity * delta
	if (velocity.y > 500):
		velocity.y = 500
	if _active:
		if Input.is_action_just_pressed("jump") && is_on_floor():
			jump(_jumpForce)
		_dir = Input.get_axis("left", "right")
	velocity.x = _dir * _speed
	updateAnimations()
	move_and_slide()
	
func jump(force):
	AudioPlayer.PlaySfx("jump")
	velocity.y = -force

func updateAnimations():
	if _dir != 0:
		_spr.flip_h = (_dir == -1)
	if is_on_floor():
		if _dir == 0:
			_spr.play("idle")
		else:
			_spr.play("run")
	else:
		if velocity.y < 0:
			_spr.play("jump")
		else:
			_spr.play("fall")
