class_name AchievementBox extends VBoxContainer

var achievement_name: String: set = _set_achievement_name

func _set_achievement_name(new_value: String) -> void:
	achievement_name = new_value
	%AchievementName.text = achievement_name
