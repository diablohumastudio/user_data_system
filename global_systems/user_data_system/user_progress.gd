class_name UserProgress extends Resource

@export_storage var total_enemies_death: int = 0 
@export_storage var external_coins: int = 0

@export_storage var level_progresses: Array[LevelProgress] = _get_level_progresses_from_files()

func _get_level_progresses_from_files() -> Array[LevelProgress]:
	var lv_prs: Array[LevelProgress]
	var dir := DirAccess.open("res://data/level_progresses/data/")
	assert(dir != null, "Could not open folder")
	dir.list_dir_begin()
	for file: String in dir.get_files():
		var complete_path: String = dir.get_current_dir() + "/" + file
		var level_progress : LevelProgress = load(complete_path)
		var lv_pr_dupl: LevelProgress = level_progress.duplicate()
		lv_prs.append(lv_pr_dupl)
	return lv_prs
