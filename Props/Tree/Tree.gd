extends Node2D

@onready var sprite = $Sprite2D
@onready var area = $Area3D


func _ready():
	area.connect("body_entered", Callable(self, "_on_Area_body_entered"))
	area.connect("body_exited", Callable(self, "_on_Area_body_exited"))


func _on_Area_body_entered(_body: Node):
	sprite.modulate.a = 0.5


func _on_Area_body_exited(_body: Node):
	sprite.modulate.a = 1
