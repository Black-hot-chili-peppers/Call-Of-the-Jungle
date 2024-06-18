extends Camera3D

var mouse = Vector2()
@export var score_by_banana :int = 100
signal get_points

func _input(event):
	if event is InputEventMouse:
		mouse = event.position
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			get_selection()

func get_selection():
	var worldspace = get_world_3d().direct_space_state
	var start = project_ray_origin(mouse)
	var end = project_position(mouse, 1000)
	var result = worldspace.intersect_ray(PhysicsRayQueryParameters3D.create(start, end))
	if (result["collider"].name == "Banana"):
		result["collider"].queue_free()
		get_points.emit(score_by_banana)
	
	
