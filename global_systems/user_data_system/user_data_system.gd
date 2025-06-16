extends Node

var user_data: UserData = UserData.new()

func _ready() -> void:
	for achievement in user_data.achievements.achievements:
		achievement.achieved.connect(_on_achievement_achieved)

func _on_achievement_achieved(achievement: Achievement) -> void:
	user_data.progress.external_coins += achievement.xp_prize
