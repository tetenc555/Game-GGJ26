extends Node


var dialogs: Dictionary  = {
	"abajur" : PackedStringArray(["ãoooooo", "anmçião","sexo3"]),
	"mesa": PackedStringArray(["Essa é minha mesa de trabalho, no tempo livre gosto de jogar jogos de fazendinha"])
}

func start_dialog_from_object(object_name: String, world_position: Vector2):
	if DialogManager.is_dialog_active:
		return
	if not dialogs.has(object_name):
		return
	var lines = dialogs[object_name]
	DialogManager.start_dialog(world_position, lines)
