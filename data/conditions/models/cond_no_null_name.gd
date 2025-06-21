class_name CondNoNullName extends Condition

func _init() -> void:
	type = Types.NO_NULL_NAME
	
func evaluate(_payload: Payload) -> void:
	if UDS.user_data.user_name != "DefaultUser":
		is_fullfilled = true
