extends MeshInstance

var state =  "waiting"

var waypoints: Array
var current_point: int = 0

var speed: float = 1.0

onready var track = get_parent()

func _ready():
	waypoints = track.get_waypoints()

func _process(delta):
	match state:
		"race":
			var move_distance = speed * delta
			move_along_path(move_distance)

func move_along_path(dist):
	if waypoints.size() == 0:
		return
	var start_point = global_transform.origin
	#for i in range(path.size()):
	var distance_to_next = start_point.distance_to(waypoints[0].global_transform.origin)
	if distance_to_next < 0.1:
		waypoints.remove(0)
		return
	global_transform.origin = global_transform.origin.linear_interpolate(waypoints[0].global_transform.origin,dist/distance_to_next)
	look_at(waypoints[0].global_transform.origin,Vector3.UP)
	#if dist <= distance_to_next and dist >= 0.0:
	#	position = start_point.linear_interpolate(path[0],dist / distance_to_next)
	#	break
	#elif dist < 0.0:
	#	position = path[0]
	#	break
	#dist -= distance_to_next
	#start_point = path[0]
	#path.remove(0)

func _on_UI_start_race():
	state = "race"
