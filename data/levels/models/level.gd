class_name Level extends Resource

@export var level_name: String
@export var progress: LevelProgress : set = _Set_lv_pr

func _Set_lv_pr(new_value: LevelProgress):
	progress = new_value
