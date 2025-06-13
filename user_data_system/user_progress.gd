class_name UserProgress extends Resource

#var level_1_progress: LevelProgress = preload("uid://jmjy1w3lg26l")
#var level_2_progress: LevelProgress = preload("uid://j4tqyes0p6gh")
#var level_3_progress: LevelProgress = preload("uid://p7emk0qaq2hv")

@export_storage var level_progresses: Array[LevelProgress] #= [level_1_progress, level_2_progress, level_3_progress]

func _init() -> void:
	level_progresses = _get_level_progresses_from_files()

func _get_level_progresses_from_files() -> Array[LevelProgress]:
	var lv_prs: Array[LevelProgress]
	var dir := DirAccess.open("res://data/level_progresses/data/")
	if dir == null: printerr("Could not open folder")
	dir.list_dir_begin()
	for file: String in dir.get_files():
		var resource := load(dir.get_current_dir() + "/" + file)
		lv_prs.append(resource)
	return lv_prs
