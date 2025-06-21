extends Control

func _ready() -> void:
	if UDS.user_data.user_name == "DefaultUser":
		%CreateNAmeLabel.show()

func _on_goto_menu_btn_pressed() -> void:
	_set_user_name()
	var menu: Menu = load(GC.SCREENS_UIDS.MENU).instantiate()
	SMS.get_container("Main").goto_scene(menu)

func _set_user_name() -> void:
	if %CreateNameTextEdit.text != "":
		UDS.user_data.user_name = %CreateNameTextEdit.text
		ACS.set_action(Action.new(Condition.Types.NO_NULL_NAME))
