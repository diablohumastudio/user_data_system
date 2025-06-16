class_name UserProgress extends Resource

@export_storage var level_progresses: Array[LevelProgress] 
@export_storage var total_enemies_death: int = 0
@export_storage var external_coins: int = 0

func _init() -> void:
	pass
	#level_progresses = _get_level_progresses_from_files()
#
#func _get_level_progresses_from_files() -> Array[LevelProgress]:
	#var lv_prs: Array[LevelProgress]
	#var dir := DirAccess.open("res://data/level_progresses/data/")
	#assert(dir != null, "Could not open folder")
	#dir.list_dir_begin()
	#for file: String in dir.get_files():
		#var resource := load(dir.get_current_dir() + "/" + file)
		#lv_prs.append(resource)
	#return lv_prs
