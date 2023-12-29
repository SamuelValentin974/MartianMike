extends ParallaxBackground

@export var _bgTexture : CompressedTexture2D = preload("res://assets/textures/bg/Blue.png")
@export var _scrollSpeed = 15

@onready var _spr = $ParallaxLayer/Sprite2D

func _ready():
	_spr.texture = _bgTexture
	
func _process(delta):
	_spr.region_rect.position += delta * Vector2(_scrollSpeed, _scrollSpeed)
	if _spr.region_rect.position >= Vector2(64,64):
		_spr.region_rect.position >= Vector2.ZERO 
