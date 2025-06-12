class_name Menu extends Control

func _on_goto_achivement_list_btn_pressed() -> void:
	var achivement_list: AchievementsList = load("uid://dkhj8khihf3xb").instantiate()
	SMS.get_container("Main").goto_scene(achivement_list)
