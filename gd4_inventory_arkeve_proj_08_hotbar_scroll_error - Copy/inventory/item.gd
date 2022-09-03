extends Node2D

var item_name = ""
var item_quantity

func _ready():
	var rand_val = randi() % 5
	if rand_val == 0:
		item_name = "Axe"
	elif rand_val == 1:
		item_name = "Common Sword"
	elif rand_val == 2:
		item_name = "Mana Potion"
	elif rand_val == 3:
		item_name = "Shield"
	else:
		item_name = "Steel Helmet"
		
#	if randi() % 2 == 0:
#		$TextureRect.texture = load("res://icons/Common Sword.png")
#	else:
#		$TextureRect.texture = load("res://icons/Axe.png")
	
	$TextureRect.texture = load("res://icons/" + item_name + ".png")
	var stack_size = int(JSONdata.item_data[item_name]["StackSize"])
	item_quantity = randi() % stack_size + 1
	if stack_size == 1:
		$Label.visible = false
	else:
		$Label.text = str(item_quantity)
		
func set_item(nm, qt):
	item_name = nm
	item_quantity = qt
	$TextureRect.texture = load("res://icons/" + item_name + ".png")
	var stack_size = int(JSONdata.item_data[item_name]["StackSize"])
	if stack_size == 1:
		$Label.visible = false
	else:
		$Label.visible = true
		$Label.text = str(item_quantity)
		
func add_item_quantity(amount_to_add):
	item_quantity += amount_to_add
	$Label.text = str(item_quantity)
func decrease_item_quantity(amount_to_remove):
	item_quantity -= amount_to_remove
	$Label.text = str(item_quantity)
