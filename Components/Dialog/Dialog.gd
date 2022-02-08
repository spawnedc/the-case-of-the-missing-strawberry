extends Control

onready var text = $RichTextLabel
onready var char_name = $CharacterName


func _ready():
	DialogManager.connect("dialog_start", self, "_on_dialog_start")
	DialogManager.connect("dialog_end", self, "_on_dialog_end")
	DialogManager.connect("event_start", self, "_on_event_start")


func _input(event):
	if event.is_action_pressed("ui_accept"):
		DialogManager.next_event()
		get_tree().set_input_as_handled()


func _on_dialog_start():
	print("Dialog started: ", DialogManager.current_timeline)
	visible = true
	DialogManager.next_event()


func _on_event_start():
	var event = DialogManager.current_event
	var event_id = event["event_id"]
	print("Event started: ", event)

	if event_id == "dialogic_001":  # Normal text event
		text.text = event["text"]
	elif event_id == "dialogic_002":  # Character event
		var char_id = event["character"]
		var character = DialogManager.characters[char_id]
		char_name.text = character["name"]
		# Move to the next event immediately.
		DialogManager.next_event()
	elif event_id == "dialogic_022":
		text.text = "[END OF DIALOG]"


func _on_dialog_end():
	visible = false
