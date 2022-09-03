extends Node

var item_data: Dictionary

func _ready():
	var item_data_file = File.new()
	item_data_file.open("res://inventory/ItemData.json", File.READ)
	var json = JSON.new()
	json.parse(item_data_file.get_as_text())
	item_data_file.close()
	item_data = json.get_data()
