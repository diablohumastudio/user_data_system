@tool
class_name AchievementPresenter extends CenterContainer

@export var achievement: Achievement : set = set_achievement

func set_achievement(new_value: Achievement) -> void:
	achievement = new_value
	if !Engine.is_editor_hint(): return
	_set_text()

func _ready() -> void:
	_set_text()

func _set_text() -> void:
	if !achievement: return

	%AchivementName.text = achievement.achievement_name
	
	if achievement.is_achieved:
		%AchievementAchieved.text = "Achieved"
	else:
		%AchievementAchieved.text = " NOT Achieved"
		%AchievementAchieved["theme_override_colors/font_color"] = Color.RED
	
	%Porcentage.text = str(achievement.porcentage_advanced) + "%"
