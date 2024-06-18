extends CharacterBody2D

signal hit

@export var speed = 200
var screen_size
var target_velocity = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	target_velocity = Vector2.ZERO
	 # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		target_velocity.x += 1
	if Input.is_action_pressed("move_left"):
		target_velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		target_velocity.y += 1
	if Input.is_action_pressed("move_up"):
		target_velocity.y -= 1

	if target_velocity.length() > 0:
		target_velocity = target_velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	velocity = target_velocity
	move_and_slide()
	# position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "right"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0


	
	# Replace with function body.
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
