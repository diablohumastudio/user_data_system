class_name CondLevEnemKill extends Condition

@export var enemies_to_kill : int 

func _init() -> void:
	type = Types.ENEMY_KILLED

func evaluate(payload: Payload) -> void:
	var enemies_killed: int = (payload as PayLevEnemKill).enemies_killed
	if enemies_killed >= enemies_to_kill :
		if !is_fullfilled: is_fullfilled = true
