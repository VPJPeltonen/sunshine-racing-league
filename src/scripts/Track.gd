extends Spatial

func get_waypoints() -> Array:
	return $Track/Waypoints.get_children()
