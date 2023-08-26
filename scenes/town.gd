extends Node2D

@onready var camera: Camera2D = $Player/Camera2D
const zoom_increment: Vector2 = Vector2(0.2, 0.2)
const max_zoom: Vector2 = Vector2(5.0, 5.0)

func _unhandled_input(_event):
	if Input.is_action_pressed("zoom_in"):
		if camera.zoom < max_zoom:
			camera.zoom = camera.zoom + zoom_increment
	elif Input.is_action_pressed("zoom_out"):
		if camera.zoom > zoom_increment:
			camera.zoom = camera.zoom - zoom_increment
	

func _physics_process(_delta):
	pass
