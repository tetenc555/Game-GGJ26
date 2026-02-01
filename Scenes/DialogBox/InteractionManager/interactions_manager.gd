extends Node


var dialogs: Dictionary  = {
	"mesaTrabalhoVerao": PackedStringArray(["Essa é minha mesa de trabalho, no tempo livre gosto de jogar jogos de fazendinha"]),
	"camaVerao": PackedStringArray(["A cama já não parece tão vazia, quanto algum tempo atras"]),
}

func start_dialog_from_object(object_name: String, world_position: Vector2):
	if DialogManager.is_dialog_active:
		return
	if not dialogs.has(object_name):
		return
	var lines = dialogs[object_name]
	DialogManager.start_dialog(world_position, lines)
