extends Node2D

onready var sprite = $Sprite
onready var roof_area = $RoofArea
onready var door_area = $Door


func _ready():
	roof_area.connect("body_entered", self, "_on_Roof_body_entered")
	roof_area.connect("body_exited", self, "_on_Roof_body_exited")
	door_area.connect("body_entered", self, "_on_Door_body_entered")


func _on_Roof_body_entered(_body: Node):
	sprite.modulate.a = 0.5


func _on_Roof_body_exited(_body: Node):
	sprite.modulate.a = 1


func _on_Door_body_entered(body: Node):
	print("Door entered: " + body.get_name())
