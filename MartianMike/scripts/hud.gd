extends Control

@onready var _labelTime = $TimeLabel

func SetTimeLabel(value):
	_labelTime.text = "TIME: " + str(value)
