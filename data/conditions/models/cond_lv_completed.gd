class_name CondLvCompleted extends Condition

@export var level_path : String 

func _init() -> void:
	type = Types.LEVEL_COMPLETED

func evaluate(_payload: Payload) -> void:
	var level : Level = load(level_path)
	if level.progress.state == LevelProgress.States.COMPLETED:
		is_fullfilled = true
