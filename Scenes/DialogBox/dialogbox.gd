extends MarginContainer

@onready var label = $MarginContainer/RichLabel
@onready var timer = $LetterDisplayTimer

signal finishedDisplaying

const MAX_WIDTH = 1024

var text := ""
var letter_index := 0
var is_typing := false

var letter_time := 0.03
var space_time := 0.01
var punctuation_time := 0.08


func _ready():
	timer.timeout.connect(_on_timer_timeout)
	label.bbcode_enabled = false
	label.fit_content = true


func display_text(t: String):
	text = t
	label.text = ""
	letter_index = 0
	is_typing = true
	
	await get_tree().process_frame
	label.custom_minimum_size.x = MAX_WIDTH
	label.autowrap_mode = TextServer.AUTOWRAP_WORD
	_display_letter()


func _display_letter():
	if letter_index >= text.length():
		is_typing = false
		finishedDisplaying.emit()
		return

	label.text += text[letter_index]
	var c = text[letter_index]
	letter_index += 1

	match c:
		"!", ".", ",", "?":
			timer.start(punctuation_time)
		" ":
			timer.start(space_time)
		_:
			timer.start(letter_time)


func _on_timer_timeout():
	_display_letter()

func finish_instantly():
	timer.stop()
	label.text = text
	letter_index = text.length()
	is_typing = false
	finishedDisplaying.emit()
