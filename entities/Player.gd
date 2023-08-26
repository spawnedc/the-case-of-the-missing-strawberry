extends CharacterBody2D

const SPEED = 200.0
var direction = Vector2.ZERO

@onready var animated_sprite = $AnimatedSprite2D
@onready var player_shadow = $Shadow
@onready var collision_shape = $CollisionShape2D

func _ready():
	animated_sprite.play('idle')
	
func _unhandled_input(_event):
	direction.x = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	# If input is digital, normalize it for diagonal movement
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()

func _physics_process(_delta):
	# Apply movement
	var movement = SPEED * direction
	set_velocity(movement)
	move_and_slide()

	if direction == Vector2.ZERO:
		animated_sprite.animation = "idle"
	else:
		animated_sprite.animation = "run"
		animated_sprite.flip_h = direction.x < 0
		if direction.x >= 0:
			player_shadow.position.x = -2
			collision_shape.position.x = -2
		else:
			player_shadow.position.x = 2
			collision_shape.position.x = 2
