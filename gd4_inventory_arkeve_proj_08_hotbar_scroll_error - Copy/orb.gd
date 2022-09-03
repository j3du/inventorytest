extends CharacterBody3D
const SlotClass = preload("res://inventory/Slot.gd")
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var item_name
var player = null
var being_picked_up = false

func _ready():
	item_name = "Steel Helmet"

func _physics_process(delta):
	if being_picked_up == false:
		velocity.y -= gravity * delta
	else:
#		var target = Vector3(0,5,0)
#		var direction = global_transform.origin.direction_to(target)
		var direction = transform.origin.direction_to(player.transform.origin)
		velocity = velocity.move_toward(direction * 300, 300 *delta)
		var distance = transform.origin.distance_to(player.transform.origin)
		if distance < 1:
			PlayerInventory.add_item(item_name, 1)
			queue_free()
	move_and_slide()

func pick_up_item(body):
	player = body
	being_picked_up = true
