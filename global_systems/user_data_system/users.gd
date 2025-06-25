class_name Users extends Resource

@export var users: Array[User] = []
@export var current_user_index: int = 0

func get_user_by_username(user_name: String)-> User:
	for user in users:
		if user.user_name == user_name:
			return user
	return null

func set_current_user_index_by_username(user_name: String):
	for user in users:
		if user.user_name == user_name:
			current_user_index = users.find(user)
