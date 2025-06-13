extends Node

var user_data: UserData = UserData.new()

var _reducers: Array[Reducer] = []

func _ready() -> void:
	_reducers = _get_reducers()

func _get_reducers() -> Array[Reducer]:
	var reds: Array[Reducer]
	var dir := DirAccess.open("res://data/reducers/data/")
	if dir == null: printerr("Could not open folder")
	dir.list_dir_begin()
	for file: String in dir.get_files():
		var resource := load(dir.get_current_dir() + "/" + file)
		reds.append(resource)
	return reds

func on_level_completed(level: Level) -> void:
	level.progress.state = LevelProgress.States.COMPLETED
	for red in _reducers:
		red.evaluate()
