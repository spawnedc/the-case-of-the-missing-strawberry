extends YSort

onready var sprite = $Sprite
onready var area = $Area


func _ready():
	area.connect("body_entered", self, "_on_Area_body_entered")
	area.connect("body_exited", self, "_on_Area_body_exited")


func _on_Area_body_entered(_body: Node):
	sprite.modulate.a = 0.5


func _on_Area_body_exited(_body: Node):
	sprite.modulate.a = 1
