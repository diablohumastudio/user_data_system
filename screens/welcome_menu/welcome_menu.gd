extends Control

func _ready() -> void:
	#%WelcomeLabel.text = UDS.get_property(UDS.PROPERTIES.USER_NAME)
	pass
	
func _on_goto_menu_btn_pressed() -> void:
	var menu: Menu = load(GC.SCREENS_UIDS.MENU).instantiate()
	SMS.get_container("Main").goto_scene(menu)

func _on_change_user_btn_pressed() -> void:
	var welcome_menu_no_user = load(GC.SCREENS_UIDS.WELCOME_MENU_NO_USER).instantiate()
	SMS.get_container("Main").goto_scene(welcome_menu_no_user)

func _on_goto_login_btn_pressed() -> void:
	%LoginPopUp.show()

func _on_goto_register_btn_pressed() -> void:
	%RegisterPopUp.show()
