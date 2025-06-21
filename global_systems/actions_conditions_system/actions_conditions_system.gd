extends Node

var _conditions: Array[Condition] = []

func _ready() -> void:
	pass
	_conditions = _get_conditions()

func _get_conditions() -> Array[Condition]:
	var conds: Array[Condition]
	var dir := DirAccess.open("res://data/conditions/data/")
	assert(dir != null, "Could not open folder")
	dir.list_dir_begin()
	for file: String in dir.get_files():
		var resource := load(dir.get_current_dir() + "/" + file)
		conds.append(resource)
	return conds

func set_action(action: Action):
	for cond in _conditions:
		if action.type == cond.type:
			cond.evaluate(action.payload)

#TODO
# achievements multiple conditions = check
# save = check
# level_progress unlock multiple conditions = check
# achievement: no null name = chevk
# achievement: level eneies killed = check
# achievement: no canons level completed
# unlock allie
# upgrade allie
