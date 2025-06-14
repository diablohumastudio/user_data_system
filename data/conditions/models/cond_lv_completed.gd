class_name CondLvCompleted extends Condition

@export var level: Level

func evaluate():
	if level.progress.state != LevelProgress.States.COMPLETED:
		return
	is_fullfilled = true
