extends Node3D
var id: String = ""
var interactionLocked: bool = false
var playerPodeInteragir: bool = false
var paredeQuarto

func trocaIDEntrada(idPar: String, body: Node3D) -> void:
	if (body.is_in_group("player") && idPar!=""):
		id = idPar
		playerPodeInteragir= true
		interactionLocked = false

func trocaIDSaida(idPar: String, body: Node3D) -> void:
	if body.is_in_group("player"):
		if id == idPar:
			id = ""
			playerPodeInteragir = false
			interactionLocked = false

func _on_dialog_finished():
	await get_tree().process_frame  # espera 1 frame
	await get_tree().process_frame  # segurança extra
	interactionLocked = false

func _process(delta):
	if playerPodeInteragir and !interactionLocked and Input.is_action_just_pressed("ui_close_dialog"):
		var screen_size = get_viewport().get_visible_rect().size
		var posicao_dialogo = Vector2(screen_size.x - 1100, screen_size.y - 100)
		interactionLocked = true
		InteractionManager.start_dialog_from_object(id, posicao_dialogo)

func _ready():
	pass
