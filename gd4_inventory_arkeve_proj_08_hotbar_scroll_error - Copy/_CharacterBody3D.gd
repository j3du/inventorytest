extends CharacterBody3D

const SPEED = 2.0
const JUMP_VELOCITY = 4.5
var put
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	velocity.x = SPEED
	move_and_slide()

func _input(event):
	if event.is_action_pressed("pickup"):
		if $PickupZone.items_in_range.size() > 0:
			var pickup_item = $PickupZone.items_in_range.values()[0]
			pickup_item.pick_up_item(self)
			$PickupZone.items_in_range.erase(pickup_item)
