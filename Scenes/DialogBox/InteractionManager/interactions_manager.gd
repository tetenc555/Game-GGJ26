extends Node


var dialogs: Dictionary  = {
	"abajur" : PackedStringArray(["sexoooooooooooooo oooooooo", "sexo2","sexo3"]),
}

func start_dialog_from_object(object_name: String, world_position: Vector2):
	if DialogManager.is_dialog_active:
		return
	if not dialogs.has(object_name):
		return
	var lines = dialogs[object_name]
	DialogManager.start_dialog(world_position, lines)
