class_name Conditions extends Resource

@export_storage var conditions: Array[Condition] = _get_conditions_from_files()

func _get_conditions_from_files() -> Array[Condition]:
	var conds: Array[Condition]
	var dir := DirAccess.open("res://data/conditions/data/")
	assert(dir != null, "Could not open folder")
	dir.list_dir_begin()
	for file: String in dir.get_files():
		var resource := load(dir.get_current_dir() + "/" + file)
		conds.append(resource)
	return conds
