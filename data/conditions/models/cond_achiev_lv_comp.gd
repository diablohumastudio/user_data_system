class_name CondAchieLvComp extends Condition

@export var necesary_levels: Array[Level]

func evaluate():
	for lv in necesary_levels:
		if lv.progress.state != LevelProgress.States.COMPLETED:
			return
	is_fullfilled = true
