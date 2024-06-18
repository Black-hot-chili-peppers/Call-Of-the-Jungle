extends Node

var score
@export var health :int = 3
@export var death :int = 1
func _ready():
	score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_camera_get_points(points):
	score += points
	print(score)

func _on_floor_fruit_touched_floor():
	health -= death
	print(health)
