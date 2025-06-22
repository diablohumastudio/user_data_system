class_name Level extends Resource

@export var level_name: String
@export var progress: LevelProgress : set = _set_lv_pr

func _set_lv_pr(new_value: LevelProgress):
	progress = new_value
	if !UDS.user_data: return
	for saved_lv_pr in UDS.user_data.progress.level_progresses:
		if saved_lv_pr.id == progress.id:
			progress = saved_lv_pr
