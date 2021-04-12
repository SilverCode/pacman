extends KinematicBody2D

var velocity = Vector2(0, 0)
var score = 0

const SPEED: int = 200

onready var sprite = $Sprite
onready var hunter_timer = $HunterTimer

func _physics_process(delta):
	if Input.is_action_just_pressed("up"):
		velocity = Vector2(0, -SPEED)
	elif Input.is_action_just_pressed("down"):
		velocity = Vector2(0, SPEED)
	elif Input.is_action_just_pressed("left"):
		velocity = Vector2(-SPEED, 0)
	elif Input.is_action_just_pressed("right"):
		velocity = Vector2(SPEED, 0)
		
	update_sprite(velocity)
	move_and_slide(velocity)
	
func update_sprite(vector):
	rotation_degrees = 0
	sprite.flip_h = false
	
	if vector.x > 0:
		sprite.flip_h = true
	elif vector.y < 0:
		rotation_degrees = 90
	elif vector.y > 0:
		rotation_degrees = 270

func add_points(points):
	score += points	
	
func start_hunter_mode():
	if not in_hunter_mode():
		print("Start Hunter Mode")
		hunter_timer.start()
		get_tree().call_group("ghosts", "enter_flee_mode")
	
func in_hunter_mode():
	return !hunter_timer.is_stopped()

func stop_hunter_mode():
	print("Stop Hunder Mode")
	get_tree().call_group("ghosts", "leave_flee_mode")
