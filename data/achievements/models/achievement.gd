class_name Achievement extends Resource

@export var achievement_name: String
@export var description: String
@export var xp_prize: int

@export var conditions: Array[Condition] : set = _set_condition

var porcentage_advanced: int = 0
var _achieved: bool = false

func _set_condition(new_value:Array[Condition]) -> void:
	assert(new_value != null, "Condition MUST not be null in an Achievement.")
	conditions = new_value
	for condition in conditions:
		if condition:
			condition.fullfilled.connect(_on_condition_fullfilled)

func _on_condition_fullfilled() -> void:
	_update_porcentage()
	_verify_achieved()

func _update_porcentage() -> void:
	var total_conditions: float = conditions.size()
	var fullfilled_conditions: float
	for condition in conditions:
		if condition.is_fullfilled:
			fullfilled_conditions += 1
	porcentage_advanced = 100 * (fullfilled_conditions / total_conditions)

func _verify_achieved() -> void:
	for condition in conditions:
		if !condition.is_fullfilled:
			return
	_achieved = true
