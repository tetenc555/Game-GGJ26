extends Node3D

var id: String = ""
var playerPodeInteragir: bool = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if (body.is_in_group("player")):
		id = "abajur"
		playerPodeInteragir= true


func _on_area_3d_body_exited(body: Node3D) -> void:
	if (body.is_in_group("player")):
		id = ""
		playerPodeInteragir= false
	
func _process(delta):
	if playerPodeInteragir and Input.is_action_pressed("ui_close_dialog"):
		var screen_size = get_viewport().get_visible_rect().size
		var posicao_dialogo = Vector2(screen_size.x / 2, screen_size.y - 100)
		InteractionManager.start_dialog_from_object(id,posicao_dialogo)
		playerPodeInteragir= false
