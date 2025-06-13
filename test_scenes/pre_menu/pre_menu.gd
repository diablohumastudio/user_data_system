extends Control

func _on_button_pressed() -> void:
	var menu: Menu = load("uid://ptmhgyquqfrt").instantiate()
	SMS.get_container("Main").goto_scene(menu)
