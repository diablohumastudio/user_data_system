class_name ReduPr extends Reducer

@export var target: LevelProgress
@export var necesary_level_progresses: Array[LevelProgress]

func evaluate():
	for lv_pr in necesary_level_progresses:
		if lv_pr.state != LevelProgress.States.COMPLETED:
			return
	if target.state == LevelProgress.States.LOCKED:
		target.state = LevelProgress.States.UNLOCKED
