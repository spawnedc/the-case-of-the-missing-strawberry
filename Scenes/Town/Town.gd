extends Node2D

onready var baddie = $Baddie


func _ready():
	# DialogManager.start("1-intro")
	var dialog = Dialogic.start("1-intro")
	add_child(dialog)
	baddie.connect("body_entered", self, "_on_Baddie_body_entered")


func _on_Baddie_body_entered(_body: Node):
	var dialog = Dialogic.start("baddieConversation")
	add_child(dialog)
