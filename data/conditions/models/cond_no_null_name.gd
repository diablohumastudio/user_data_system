class_name CondNoNullName extends Condition

func _init() -> void:
	type = Types.NO_NULL_NAME
	
func evaluate(_payload: Payload) -> void:
	if UDS.get_property(UDS.PROPERTIES.USER_NAME) != GC.DEFAULT_USER_NAME:
		if !is_fullfilled: is_fullfilled = true
