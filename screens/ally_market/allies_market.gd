class_name AlliesMarket extends Control

@onready var ally_presenter_pksc: PackedScene = load("uid://cwnts0gje8jcg")

func _ready() -> void:
	for child in %HBoxContainer.get_children():
		child.queue_free()
	for ally in UDS.get_property(UDS.PROPERTIES.ALLIES_INVENTORY):
		var new_ally_presenter: MarketAllyPresenter = ally_presenter_pksc.instantiate()
		new_ally_presenter.ally_name = ally.ally_name
		new_ally_presenter.ally_price = ally.price
		%HBoxContainer.add_child(new_ally_presenter)
