class_name Menu extends Control

func _on_goto_achievement_list_btn_pressed() -> void:
	var achivement_list: AchievementsList = load(GC.SCREENS_UIDS.ACHIEVEMENT_LIST).instantiate()
	SMS.get_container("Main").goto_scene(achivement_list)
