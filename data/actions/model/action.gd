class_name Action extends Resource

var type: Condition.Types
var payload : Payload

func _init(_type: Condition.Types, _payload: Payload = Payload.new()) -> void:
	type = _type
	payload = _payload
