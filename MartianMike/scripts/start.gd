extends StaticBody2D

@onready var _spawnPos = $SpawnPos

func GetSpawnPos():
	return _spawnPos.global_position
