extends Node

const _FILE_NAME : String = "user://user_data.tres"

var user_data: UserData = _initialize_user_data()

func _ready() -> void:
	for achievement in user_data.achievements.achievements:
		achievement.achieved.connect(_on_achievement_achieved)

func _initialize_user_data()-> UserData:
	if ResourceLoader.exists(_FILE_NAME):
		user_data = ResourceLoader.load(_FILE_NAME)
	else:
		user_data = UserData.new()
	return user_data

func _on_achievement_achieved(achievement: Achievement) -> void:
	user_data.progress.external_coins += achievement.xp_prize

func save_data_to_disk():
	var result := ResourceSaver.save(user_data, _FILE_NAME)
	assert(result == OK)
