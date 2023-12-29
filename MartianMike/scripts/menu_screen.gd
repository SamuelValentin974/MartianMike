extends Control

func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()


func _on_btn_start_pressed():
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _on_btn_quit_pressed():
		get_tree().quit()
