class_name Level extends Resource

@export var level_name: String
@export var progress: LevelProgress : set = _set_lv_pr

func _set_lv_pr(new_value: LevelProgress):
	progress = new_value
	if !UDS.current_user_data: return
	progress = _get_level_progress_copy_from_user_data(progress)

func _get_level_progress_copy_from_user_data(level_progress: LevelProgress) -> LevelProgress:
	var lv_pr_copy: LevelProgress
	for saved_lv_pr in UDS.get_property(UDS.PROPERTIES.LV_PROGRESSES) as Array[LevelProgress]:
		if saved_lv_pr.id == level_progress.id:
			lv_pr_copy = saved_lv_pr
	return lv_pr_copy
