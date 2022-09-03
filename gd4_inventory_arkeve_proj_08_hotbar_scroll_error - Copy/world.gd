extends Node3D


func _input(event):
	if event.is_action_pressed("menu"):
		$Inventory.visible = !$Inventory.visible
		$Inventory.initialize_inventory()
	if event.is_action_pressed("scrollup"):
		PlayerInventory.active_item_scroll_up()
	elif event.is_action_pressed("scrolldown"):
		PlayerInventory.active_item_scroll_down()
