extends Node2D


func _ready():
	var dialog = Dialogic.start("1-intro")
	add_child(dialog)
