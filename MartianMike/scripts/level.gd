extends Node2D

@export var _nextScene : PackedScene = null
@export var _timeLevel = 10
@export var _isFinalLevel: bool = false

@onready var _start = $Start
@onready var _player = null
@onready var _exit = $End
@onready var _deathZone = $DeathZone
@onready var _hud = $UILayer/HUD
@onready var _uiLayer = $UILayer

var _timeLeft
var _timer
var _win = false

func _ready():
	_player = get_tree().get_first_node_in_group("player")
	if _player != null:
		_player.position = _start.GetSpawnPos()	
	var traps = get_tree().get_nodes_in_group("traps")
	for nodes in traps:
		nodes.connect("touched_player", _on_trap_touched_player)
	_exit.body_entered.connect(_on_exit_body_entered)
	_deathZone.body_entered.connect(_on_death_zone_body_entered)
	_timeLeft = _timeLevel
	_timer = Timer.new()
	_timer.name = "Level timer"
	_timer.wait_time = 1
	_timer.timeout.connect(_on_level_timer_timeout)
	add_child(_timer)
	_timer.start()
	_hud.SetTimeLabel(_timeLeft)		

func _on_level_timer_timeout():
	if !_win:
		_timeLeft -= 1
		_hud.SetTimeLabel(_timeLeft)		
		if _timeLeft < 0:
			AudioPlayer.PlaySfx("hurt")
			ResetPlayer()
			_timeLeft = _timeLevel
			_hud.SetTimeLabel(_timeLeft)

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_death_zone_body_entered(body):
	AudioPlayer.PlaySfx("hurt")
	ResetPlayer()


func _on_trap_touched_player():
	AudioPlayer.PlaySfx("hurt")
	ResetPlayer()

func ResetPlayer():
	_player.velocity = Vector2.ZERO
	_player.position = _start.GetSpawnPos()

func _on_exit_body_entered(body):
	if body is Player:
		if _isFinalLevel || (_nextScene != null):
			_exit.animate()
			_player._active = false
			_player._dir = 0
			await get_tree().create_timer(2).timeout
			if _isFinalLevel:
				_uiLayer.ShowWinScreen(true)
			else:
				get_tree().change_scene_to_packed(_nextScene)
