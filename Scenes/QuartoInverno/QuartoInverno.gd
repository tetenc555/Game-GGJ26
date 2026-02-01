extends Node3D
@onready var musica_verao = $musicaVerao

var id: String = ""
var interactionLocked: bool = false
var playerPodeInteragir: bool = false
var paredeQuarto
var interacao:=0

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
	if interacao>=5:
		await DialogManager.dialog_finished
		SceneController.change_scene("res://Scenes/BaileVazio/bailevazio.tscn")
	
	if playerPodeInteragir and !interactionLocked and Input.is_action_just_pressed("ui_close_dialog"):
		var screen_size = get_viewport().get_visible_rect().size
		var posicao_dialogo = Vector2(screen_size.x - 1100, screen_size.y - 100)
		interactionLocked = true
		InteractionManager.start_dialog_from_object(id, posicao_dialogo)
		interacao+=1


func _on_dialog_finished():
	await get_tree().process_frame  # espera 1 frame
	await get_tree().process_frame  # segurança extra
	interactionLocked = false


func _ready():
	DialogManager.dialog_finished.connect(_on_dialog_finished)
	paredeQuarto = $"P-S-W"
	var screen_size = get_viewport().get_visible_rect().size
	var posicao_dialogo = Vector2(screen_size.x - 1100, screen_size.y - 100)
	InteractionManager.start_dialog_from_object("Narrador4", posicao_dialogo)
	
	
	

func entered_bedroom(body: Node3D) -> void:
	if body.is_in_group("player"):
		move_camera(Vector3(12.28, 24.00, -2.76))
		fade_out(paredeQuarto)

func exited_bedroom(body: Node3D) -> void:
	if body.is_in_group("player"):
		move_camera(Vector3(30.81, 27.27, 0.36))
		fade_in(paredeQuarto)
		
func _on_interacao_mesa_body_entered(body):
	trocaIDEntrada("mesaInverno",body);
	

	trocaIDEntrada("mesaInverno",body)
	
func _on_interacao_mesa_body_exited(body):
	trocaIDSaida("mesaInverno",body)

func _on_interacao_banheiro_body_entered(body):
	trocaIDEntrada("banheiroGeral",body);
	
	trocaIDEntrada("banheiroGeral",body)

func _on_interacao_banheiro_body_exited(body):
	trocaIDSaida("banheiroGeral",body)

func _on_interacao_cama_body_entered(body):
	trocaIDEntrada("camaInverno",body);
	
	trocaIDEntrada("camaInverno",body)

func _on_interacao_cama_body_exited(body):
	trocaIDSaida("camaInverno",body)

func _on_interacao_cabeceira_body_entered(body):
	trocaIDEntrada("cabeceiraInverno",body);
	
	trocaIDEntrada("cabeceiraInverno",body)

func _on_interacao_cabeceira_body_exited(body):
	trocaIDSaida("cabeceiraInverno",body)

func _on_interacao_geladeira_body_entered(body):
	trocaIDEntrada("geladeiraInverno",body);
	
	trocaIDEntrada("geladeiraInverno",body)

func _on_interacao_geladeira_body_exited(body):
	trocaIDSaida("geladeiraInverno",body)

func _on_interacao_pia_body_entered(body):
	trocaIDEntrada("piaInverno",body);
	
	trocaIDEntrada("piaInverno",body)

func _on_interacao_pia_body_exited(body):
	trocaIDSaida("piaInverno",body)

func _on_interacao_lava_roupa_body_entered(body):
	trocaIDEntrada("lavaRoupaInverno",body);
	
	trocaIDEntrada("lavaRoupaInverno",body)

func _on_interacao_lava_roupa_body_exited(body):
	trocaIDSaida("lavaRoupaInverno",body)

func _on_interacao_sofa_body_entered(body):
	trocaIDEntrada("sofaInverno",body);
	
	trocaIDEntrada("sofaInverno",body)

func _on_interacao_sofa_body_exited(body):
	trocaIDSaida("sofaInverno",body)

func _on_interacao_tv_body_entered(body):
	trocaIDEntrada("TVInverno",body);
	
	trocaIDEntrada("TVInverno",body)

func _on_interacao_tv_body_exited(body):
	trocaIDSaida("TVInverno",body)

func _on_interacao_fogao_body_entered(body):
	trocaIDEntrada("fogaoInverno",body);
	
	trocaIDEntrada("fogaoInverno",body)

func _on_interacao_fogao_body_exited(body):
	trocaIDSaida("fogaoInverno",body)

func _on_interacao_banco_body_entered(body):
	trocaIDEntrada("bancoInverno",body);
	
	trocaIDEntrada("bancoInverno",body)

func _on_interacao_banco_body_exited(body):
	trocaIDSaida("bancoInverno",body)

func _on_interacao_armario_body_entered(body):
	trocaIDEntrada("armarioInverno",body);
	
	trocaIDEntrada("armarioInverno",body)

func _on_interacao_armario_body_exited(body):
	trocaIDSaida("armarioInverno",body)

func _on_interacao_estante_body_entered(body):
	trocaIDEntrada("estanteInverno",body);
	
	trocaIDEntrada("estanteInverno",body)

func _on_interacao_estante_body_exited(body):
	trocaIDSaida("estanteInverno",body)

func _on_interacao_janela_body_entered(body):
	trocaIDEntrada("janelaInverno",body);
	
	trocaIDEntrada("janelaInverno",body)

func _on_interacao_janela_body_exited(body):
	trocaIDSaida("janelaInverno",body)

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
