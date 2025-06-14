class_name Action extends Resource

@export var type: Condition.Types
var payload : Dictionary

func _init(_type: Condition.Types, _payload: Dictionary = {}) -> void:
	type = _type
	payload = _payload
