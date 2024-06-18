extends RigidBody3D

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _die():
	queue_free()



func _on_body_entered(body):
	print(body) # Replace with function body.
