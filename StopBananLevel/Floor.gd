extends RigidBody3D
signal fruit_touched_floor

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if (body.name == "Banana"):
		body.queue_free()
		fruit_touched_floor.emit()
