extends CharacterBody2D

signal hit

@export var speed = 200
var screen_size
var target_velocity = Vector2.ZERO
var is_game_ended:bool = false
@onready var Text = $"../WinText"
@onready var WalkSound = $"../AudioStreamPlayer"

func _ready():
	screen_size = get_viewport_rect().size

func _walk():
	await get_tree().create_timer(0.1).timeout
	$"../AudioStreamPlayer".playing = true

func _physics_process(delta):
	target_velocity = Vector2.ZERO
	 # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		target_velocity.x += 1
	if Input.is_action_pressed("move_left"):		target_velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		target_velocity.y += 1
	if Input.is_action_pressed("move_up"):
		target_velocity.y -= 1

	if !is_game_ended:
		if target_velocity.length() > 0:
			target_velocity = target_velocity.normalized() * speed
			$AnimatedSprite2D.play()
			if !WalkSound.playing:
				WalkSound.play()
		elif WalkSound.playing:
			WalkSound.stop()
		else:
			$AnimatedSprite2D.stop()

	velocity = target_velocity
	move_and_slide()
	# position = position.clamp(Vector2.ZERO, screen_size)
	
	if !is_game_ended:
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


func _on_area_2d_body_entered(body):
	print("win")
	Text.visible = true
	Engine.time_scale = 0
	is_game_ended = true
