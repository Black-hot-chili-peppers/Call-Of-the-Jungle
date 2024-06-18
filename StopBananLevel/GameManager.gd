extends Node

var score
@export var health :int = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_camera_get_points(points):
	score += points
	print(score)
