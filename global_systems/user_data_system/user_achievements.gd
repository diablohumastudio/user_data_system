class_name UserAchievements extends Resource

@export var achievements: Array[Achievement] 

func _init() -> void:
	achievements = _get_achievements_from_files()

func _get_achievements_from_files() -> Array[Achievement]:
	var achs: Array[Achievement]
	var dir := DirAccess.open("res://data/achievements/data/")
	assert(dir != null, "Could not open folder")
	dir.list_dir_begin()
	for file: String in dir.get_files():
		var resource := load(dir.get_current_dir() + "/" + file)
		achs.append(resource)
	return achs
