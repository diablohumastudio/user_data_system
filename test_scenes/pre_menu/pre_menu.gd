extends Control

func _on_button_pressed() -> void:
	var menu: Menu = load(GC.SCREENS_UIDS.MENU).instantiate()
	SMS.get_container("Main").goto_scene(menu)
