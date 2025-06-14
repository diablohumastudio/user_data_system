class_name CondLvCompleted extends Condition

@export var level: Level

func _init() -> void:
	type = Types.LEVEL_COMPLETED

func evaluate():
	if level.progress.state != LevelProgress.States.COMPLETED:
		return
	is_fullfilled = true
