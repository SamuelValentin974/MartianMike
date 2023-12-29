extends Node

var jump = preload("res://assets/audio/jump.wav")
var hurt = preload("res://assets/audio/hurt.wav")

func PlaySfx(name: String):
	var stream = null
	if name == "jump":
		stream = jump
	elif name == "hurt":
		stream = hurt
	else:
		print("error sfx name")
		return
	var asp = AudioStreamPlayer.new()
	asp.stream = stream
	asp.volume_db = -8
	add_child(asp)
	asp.play()
