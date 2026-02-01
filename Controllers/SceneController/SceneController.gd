extends Node

@onready var fade_rect: ColorRect = $CanvasLayer/FadeRect

var fade_time := 0.5
var is_transitioning := false

func _ready():
	fade_rect.color = Color(0,0,0,0)
	process_mode = Node.PROCESS_MODE_ALWAYS # roda mesmo pausado

	
func change_scene(path: String):
	if is_transitioning:
		return
	
	is_transitioning = true
	
	await fade(1.0)  # escurece
	get_tree().change_scene_to_file(path)
	await get_tree().process_frame
	await fade(0.0)  # clareia
	
	is_transitioning = false


	
func fade(target_alpha: float):
	var tween = create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tween.tween_property(fade_rect, "color:a", target_alpha, fade_time)
	await tween.finished
