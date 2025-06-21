extends Control

func _ready() -> void:
	%UserName.text = UDS.user_data.user_name
	%UserCoins.text = str(UDS.user_data.progress.external_coins)
