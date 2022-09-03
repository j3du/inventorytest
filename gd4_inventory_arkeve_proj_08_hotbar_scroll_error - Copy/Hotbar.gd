extends Node2D
const SlotClass = preload("res://inventory/Slot.gd")
@onready var hotbar = $HotbarSlots
@onready var slots = hotbar.get_children()
func _ready():
	for i in range(slots.size()):
#		slots[i].gui_input.connect(self. slot_gui_input.bind(slots[i]))
		PlayerInventory.active_item_updated.connect(slots[i].refresh_style)
		slots[i].slot_index = i
		slots[i].slot_type = SlotClass.SlotType.HOTBAR
	initialize_hotbar()
func initialize_hotbar():
	for i in range(slots.size()):
		if PlayerInventory.hotbar.has(i):
			slots[i].initialized_item(PlayerInventory.hotbar[i][0], PlayerInventory.hotbar[i][1])
