class_name ReduAchieLvComp extends Reducer

@export var target: Achievement
@export var necesary_level_progresses: Array[LevelProgress]

func evaluate():
	for lv_pr in necesary_level_progresses:
		if lv_pr.state != LevelProgress.States.COMPLETED:
			return
	target.achieved = true
