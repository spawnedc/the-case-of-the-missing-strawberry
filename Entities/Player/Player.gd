extends KinematicBody2D

const SPEED := 200

var velocity = Vector2.ZERO

onready var animated_sprite = $AnimatedSprite


func _physics_process(_delta):
	# Get player input
	var direction: Vector2
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	# If input is digital, normalize it for diagonal movement
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()

	# Apply movement
	var movement = SPEED * direction
	velocity = move_and_slide(movement)

	if direction == Vector2.ZERO:
		animated_sprite.animation = "idle"
	else:
		animated_sprite.animation = "run"
		animated_sprite.flip_h = direction.x < 0
