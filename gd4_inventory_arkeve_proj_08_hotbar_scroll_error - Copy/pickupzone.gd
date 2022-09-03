extends Area3D

var items_in_range = {}

func _on_pickup_zone_body_entered(body):
	items_in_range[body] = body

func _on_pickup_zone_body_exited(body):
	if items_in_range.has(body):
		items_in_range.erase(body)
