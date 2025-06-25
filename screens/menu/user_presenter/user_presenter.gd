extends Control

func _ready() -> void:
	%UserName.text = UDS.get_property(UDS.PROPERTIES.USER_NAME)
	%UserCoins.text = str(UDS.get_property(UDS.PROPERTIES.EXTERNAL_COINS))
