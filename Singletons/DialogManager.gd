extends Node

signal dialog_start
signal dialog_end
signal event_start
signal event_end

var characters = {}
var timelines = {}
var current_timeline
var current_event
var current_event_index
var dialog_ended = false


func list_to_dict(list):
	var dict := {}
	for val in list:
		dict[val["name"]] = val
	return dict


func _ready():
	characters = DialogicUtil.get_characters_dict()
	timelines = list_to_dict(DialogicUtil.get_timeline_list())


func start(dialog_name: String):
	#var timeline_path = timelines[dialog_name]["file"]
	#current_timeline = DialogicResources.get_timeline_json(timeline_path)
	#current_event_index = -1
	#current_event = null
	#dialog_ended = false
	#emit_signal("dialog_start")


func next_event():
	if dialog_ended:
		return

	if current_event:
		emit_signal("event_end")

	current_event_index += 1
	if current_event_index < current_timeline["events"].size():
		current_event = current_timeline["events"][current_event_index]
		emit_signal("event_start")
	else:
		current_event = null
		current_event_index = -1
		dialog_ended = true
		emit_signal("dialog_end")
