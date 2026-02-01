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

func _process(delta):
	if playerPodeInteragir and !interactionLocked and Input.is_action_just_pressed("ui_close_dialog"):
		var screen_size = get_viewport().get_visible_rect().size
		var posicao_dialogo = Vector2(screen_size.x - 1100, screen_size.y - 100)
		interactionLocked = true
		InteractionManager.start_dialog_from_object(id, posicao_dialogo)


func _on_dialog_finished():
	await get_tree().process_frame  # espera 1 frame
	await get_tree().process_frame  # segurança extra
	interactionLocked = false


func _ready():
	DialogManager.dialog_finished.connect(_on_dialog_finished)
	paredeQuarto = $"P-S-W"
	var screen_size = get_viewport().get_visible_rect().size
	var posicao_dialogo = Vector2(screen_size.x - 1100, screen_size.y - 100)
	#InteractionManager.start_dialog_from_object("", posicao_dialogo)
	#await DialogManager.dialog_finished
	
	

func entered_bedroom(body: Node3D) -> void:
	if body.is_in_group("player"):
		move_camera(Vector3(12.28, 24.00, -2.76))
		fade_out(paredeQuarto)

func exited_bedroom(body: Node3D) -> void:
	if body.is_in_group("player"):
		move_camera(Vector3(30.81, 27.27, 0.36))
		fade_in(paredeQuarto)

func fade_out(node: CSGBox3D):
	var mat = node.material
	var tween = create_tween()
	tween.tween_property(mat, "albedo_color:a", 0.1, 0.5)

func fade_in(node: CSGBox3D):
	node.visible = true
	var mat = node.material
	var tween = create_tween()
	tween.tween_property(mat, "albedo_color:a", 1, 0.5)

func move_camera(pos: Vector3):
	var cam = $Camera3D
	var tween = create_tween()
	tween.tween_property(cam, "global_position", pos, 0.8) \
		.set_trans(Tween.TRANS_SINE) \
		.set_ease(Tween.EASE_IN_OUT)

#interactions

func _on_interacao_mesa_body_entered(body: Node3D) -> void:
	trocaIDEntrada("",body);


func _on_interacao_mesa_body_exited(body: Node3D) -> void:
	trocaIDSaida("",body);


func _on_interacao_cama_body_entered(body: Node3D) -> void:
	trocaIDEntrada("",body)

func _on_interacao_cama_body_exited(body: Node3D) -> void:
	trocaIDSaida("",body);


func _on_interacao_cabeceira_body_entered(body: Node3D) -> void:
	trocaIDEntrada("",body)


func _on_interacao_cabeceira_body_exited(body: Node3D) -> void:
	trocaIDSaida("",body);


func _on_interacao_geladeira_body_entered(body: Node3D) -> void:
	trocaIDEntrada("",body)


func _on_interacao_geladeira_body_exited(body: Node3D) -> void:
	trocaIDSaida("",body);


func _on_interacao_pia_body_entered(body: Node3D) -> void:
	trocaIDEntrada("",body)


func _on_interacao_pia_body_exited(body: Node3D) -> void:
	trocaIDSaida("",body);


func _on_interacao_lava_roupa_body_entered(body: Node3D) -> void:
	trocaIDEntrada("",body)


func _on_interacao_lava_roupa_body_exited(body: Node3D) -> void:
	trocaIDSaida("",body);


func _on_interacao_fogao_body_entered(body: Node3D) -> void:
	trocaIDEntrada("",body)


func _on_interacao_fogao_body_exited(body: Node3D) -> void:
	trocaIDSaida("",body);


func _on_interacao_sofa_body_entered(body: Node3D) -> void:
	trocaIDEntrada("",body)


func _on_interacao_sofa_body_exited(body: Node3D) -> void:
	trocaIDSaida("",body);

func _on_interacao_tv_body_entered(body: Node3D) -> void:
	trocaIDEntrada("",body)


func _on_interacao_tv_body_exited(body: Node3D) -> void:
	trocaIDSaida("",body);


func _on_interacao_banco_body_entered(body: Node3D) -> void:
	trocaIDEntrada("",body)


func _on_interacao_banco_body_exited(body: Node3D) -> void:
	trocaIDSaida("",body);


func _on_interacao_armario_body_entered(body: Node3D) -> void:
	trocaIDEntrada("",body)


func _on_interacao_armario_body_exited(body: Node3D) -> void:
	trocaIDSaida("",body);
