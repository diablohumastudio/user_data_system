extends Node

var user_data: UserData = UserData.new()

var _conditions: Array[Condition] = []

func _ready() -> void:
	_conditions = _get_conditions()

func _get_conditions() -> Array[Condition]:
	var conds: Array[Condition]
	var dir := DirAccess.open("res://data/conditions/data/")
	if dir == null: printerr("Could not open folder")
	dir.list_dir_begin()
	for file: String in dir.get_files():
		var resource := load(dir.get_current_dir() + "/" + file)
		conds.append(resource)
	return conds

func on_level_completed(level: Level) -> void:
	level.progress.state = LevelProgress.States.COMPLETED
	for cond in _conditions:
		cond.evaluate()
