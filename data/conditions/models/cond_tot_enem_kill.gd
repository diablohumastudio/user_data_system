class_name CondTotEnemKill extends Condition

@export var enemies_to_kill: int

func _init() -> void:
	type = Types.ENEMY_KILLED

func evaluate(_payload: Payload) -> void:
	var enemies_killed: int = UDS.get_property(UDS.PROPERTIES.TOT_ENEM_DEATHS)
	if enemies_killed >= enemies_to_kill :
		if !is_fullfilled: is_fullfilled = true
