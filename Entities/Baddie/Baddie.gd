extends Area2D

const SPEED := 200

var velocity = Vector2.ZERO
var direction = Vector2.ZERO

onready var animated_sprite = $AnimatedSprite


func _physics_process(_delta):
	if direction == Vector2.ZERO:
		animated_sprite.animation = "idle"
	else:
		animated_sprite.animation = "run"
		animated_sprite.flip_h = direction.x < 0
