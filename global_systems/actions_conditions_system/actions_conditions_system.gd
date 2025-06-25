extends Node

func set_action(action: Action):
	var conditions: Array[Condition] = UDS.get_property(UDS.PROPERTIES.CONDITIONS)
	for cond in conditions:
		if action.type == cond.type:
			cond.evaluate(action.payload)
	pass

#TODO
# achievements multiple conditions = check
# save = check
# level_progress unlock multiple conditions = check
# achievement: no null name = chevk
# achievement: level eneies killed = check
# achievement: no canons level completed
# unlock allie
# upgrade allie
