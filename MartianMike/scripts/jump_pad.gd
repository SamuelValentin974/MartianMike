extends Area2D
@onready var _spr = $AnimatedSprite2D
@export var _force = 250

func _on_body_entered(body):
	if body is Player:
		_spr.play("jump")
		body.jump(_force)
