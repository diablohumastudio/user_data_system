class_name UserAchievements extends Resource

@export_storage var achievements: Array[Achievement] = _get_achievements_from_files()

func _get_achievements_from_files() -> Array[Achievement]:
	var achs: Array[Achievement]
	var dir := DirAccess.open("res://data/achievements/data/")
	assert(dir != null, "Could not open folder")
	dir.list_dir_begin()
	for file: String in dir.get_files():
		var achievement : Achievement = load(dir.get_current_dir() + "/" + file)
		var achi_dupl: Achievement = achievement.duplicate()
		achs.append(achi_dupl)
	return achs
