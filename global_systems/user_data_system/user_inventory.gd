class_name UserAllyInventory extends Resource

@export_storage var allies_inventory: Array[Ally] = _get_allies_from_files()

func _get_allies_from_files() -> Array[Ally]:
	var allies: Array[Ally]
	var dir := DirAccess.open("res://data/allies/data/")
	assert(dir != null, "Could not open folder")
	dir.list_dir_begin()
	for file: String in dir.get_files():
		var resource := load(dir.get_current_dir() + "/" + file)
		allies.append(resource.duplicate())
	return allies
