extends Node

@onready var text_box_scene = preload("res://Scenes/DialogBox/DialogBox.tscn")

var dialog_lines: Array[String] = []

var current_line_index = 0

var text_box
var text_box_position: Vector2
var is_dialog_active = false
var can_advance_line = false
signal dialog_finished

func start_dialog(position: Vector2, lines: Array[String]):
	if is_dialog_active:
		return
	dialog_lines = lines
	text_box_position = position
	_lock_player(true)
	_show_text_box()
	is_dialog_active = true
	if(current_line_index+1 < lines.size()):
		can_advance_line=true
	
func _show_text_box():
	if text_box != null:
		text_box.queue_free()
	text_box = text_box_scene.instantiate()
	text_box.finishedDisplaying.connect(_on_text_box_finished_displaying)
	get_tree().root.add_child(text_box)
	text_box.global_position = text_box_position
	text_box.display_text(dialog_lines[current_line_index])
	can_advance_line= false
	
func _on_text_box_finished_displaying():
	can_advance_line = true
	
func _unhandled_input(event):
	if not event.is_action_pressed("ui_close_dialog"):
		return
	if not is_dialog_active:
		return

	if text_box.is_typing:
		text_box.finish_instantly()
		return

	current_line_index += 1
	if current_line_index >= dialog_lines.size():
		text_box.queue_free()
		text_box = null
		is_dialog_active = false
		current_line_index = 0
		dialog_finished.emit()
		_lock_player(false)
		return

	_show_text_box()


func _lock_player(state: bool):
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.input_locked = state

func _ready():
	var dialog_box = get_tree().get_first_node_in_group("dialog_box")
