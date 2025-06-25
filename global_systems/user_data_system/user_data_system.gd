extends Node

signal user_changed

const _USERS_FILE_NAME: String = "user://users.tres"
const _USER_DATA_BASE_FILE_PATH: String = "user://"

enum PROPERTIES {USER_NAME, ALLIES_INVENTORY, TOT_ENEM_DEATHS, EXTERNAL_COINS, LV_PROGRESSES, ACHIEVEMENTS, MUSIC_VOLUME, SFX_VOLUME, CONDITIONS}

var users: Users
var current_user_data: UserData

func _ready() -> void:
	_initialize_users()

func _initialize_users():
	if ResourceLoader.exists(_USERS_FILE_NAME):
		users = ResourceLoader.load(_USERS_FILE_NAME)
		current_user_data = load(_USER_DATA_BASE_FILE_PATH + users.users[users.current_user_index].user_name + ".tres")
	else: 
		users = Users.new()
		add_new_user(User.new())

func _conect_achievements_with_money():
	for achievement in current_user_data.achievements.achievements:
		achievement.achieved.connect(_on_achievement_achieved)

func _on_achievement_achieved(achievement: Achievement) -> void:
	current_user_data.progress.external_coins += achievement.xp_prize

#region UsersFunctionsInterface
func add_new_user(_user: User, set_to_current_user_data: bool = true) -> void:
	for user in users.users:
		print(user)
		if user.user_name == _user.user_name:
			push_error("User with same name already created.")
			return
	users.users.append(_user)
	users.current_user_index = users.users.find(_user)
	var new_user_data = UserData.new()
	new_user_data.user = _user
	current_user_data = new_user_data
	save_data_to_disk()

func change_user(user_name: String) -> void:
	users.set_current_user_index_by_username(user_name)
	current_user_data = load(_USER_DATA_BASE_FILE_PATH + user_name + ".tres")

func validate_user_password(user_name: String, password:String) -> bool:
	var user_to_validate: User = users.get_user_by_username(user_name)
	if user_to_validate.password == password:
		return true
	return false

func user_exists(user_name: String) -> bool:
	for user in users.users:
		if user.user_name == user_name:
			return true
	return false
#endregion

func save_data_to_disk():
	var result := ResourceSaver.save(current_user_data, _USER_DATA_BASE_FILE_PATH + current_user_data.user.user_name + ".tres")
	assert(result == OK)
	result = ResourceSaver.save(users, _USERS_FILE_NAME)
	assert(result == OK)

func get_property(property: PROPERTIES):
	match property:
		PROPERTIES.USER_NAME:
			return current_user_data.user.user_name
		PROPERTIES.ALLIES_INVENTORY:
			return current_user_data.allies_inventory.allies_inventory
		PROPERTIES.TOT_ENEM_DEATHS:
			return current_user_data.progress.total_enemies_death
		PROPERTIES.EXTERNAL_COINS:
			return current_user_data.progress.external_coins
		PROPERTIES.LV_PROGRESSES:
			return current_user_data.progress.level_progresses
		PROPERTIES.ACHIEVEMENTS:
			return current_user_data.achievements.achievements
		PROPERTIES.MUSIC_VOLUME:
			return current_user_data.settings.music_volume
		PROPERTIES.SFX_VOLUME:
			return current_user_data.settings.sfx_volume
		PROPERTIES.CONDITIONS:
			return current_user_data.conditions.conditions

func increase_total_enemies_death() -> void:
	current_user_data.progress.total_enemies_death += 1
