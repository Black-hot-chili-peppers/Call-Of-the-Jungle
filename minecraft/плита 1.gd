extends RigidBody3D

func _ready():
	body_entered.connect(handle_body_entered)
	body_exited.connect(handle_body_exited)

func handle_body_entered(p_1):
	p_1.enable_interaction(self)
	print("hello")
func handle_body_exited(p_1):
	p_1.disable_interaction()
