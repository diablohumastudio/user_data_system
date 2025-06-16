class_name MarketAllyPresenter extends VBoxContainer

var ally_name: String : set = _set_ally_name
var ally_price: int : set = _set_ally_price

func _set_ally_name(new_value: String):
	ally_name = new_value
	%AllyName.text = ally_name

func _set_ally_price(new_value: int):
	ally_price = new_value
	%AllyPrice.text = str(ally_price)

func _on_button_pressed() -> void:
	pass # Replace with function body.
