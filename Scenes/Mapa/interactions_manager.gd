extends Node


var dialogs = {
	"abajur" = [
		"sexo",
		"sexo2"
	],
}

func start_dialog_from_object(object_name: String, world_position: Vector2):
	if not dialogs.has(object_name):
		print("Dialogo nao encontrado para:", object_name)
		return
	var lines = dialogs[object_name]
	DialogManager.start_dialog(world_position, lines)
