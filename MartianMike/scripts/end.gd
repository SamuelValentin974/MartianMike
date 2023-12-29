extends Area2D

@onready var _spr = $AnimatedSprite2D

func animate():
	_spr.play("end")
