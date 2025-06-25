class_name Achievement extends Resource

signal achieved(achievement: Achievement)

@export var achievement_name: String
@export var description: String
@export var xp_prize: int

@export var conditions: Array[Condition] : set = _set_condition

@export_storage var porcentage_advanced: int = 0
@export_storage var is_achieved: bool = false

func _set_condition(new_value:Array[Condition]) -> void:
	assert(new_value != null, "Condition MUST not be null in an Achievement.")
	conditions = new_value
	if !UDS.current_user_data: return
	for condition in conditions:
		if condition:
			if _get_condition_copy_from_user_data(condition):
				condition = _get_condition_copy_from_user_data(condition)
			else:
				condition = condition.duplicate()
			condition.fullfilled.connect(_on_condition_fullfilled)

func _get_condition_copy_from_user_data(condition: Condition) -> Condition:
	var copy_condition: Condition
	for saved_condition in UDS.get_property(UDS.PROPERTIES.CONDITIONS) as Array[Condition]:
		if saved_condition.id == condition.id:
			copy_condition = saved_condition
	return copy_condition

func _on_condition_fullfilled() -> void:
	_update_porcentage()
	_verify_achieved()

func _update_porcentage() -> void:
	var total_conditions: float = conditions.size()
	var fullfilled_conditions: float = 0
	for condition in conditions:
		if condition.is_fullfilled:
			fullfilled_conditions += 1
	porcentage_advanced = int(100 * (fullfilled_conditions / total_conditions))

func _verify_achieved() -> void:
	for condition in conditions:
		if !condition.is_fullfilled:
			return
	is_achieved = true
	achieved.emit(self)
	_disconect_conditions_signals()

func _disconect_conditions_signals() -> void:
	for condition in conditions:
		if condition:
			condition.fullfilled.disconnect(_on_condition_fullfilled)
