extends Node2D


func _ready():
	# DialogManager.start("1-intro")
	var dialog = Dialogic.start("1-intro")
	add_child(dialog)
