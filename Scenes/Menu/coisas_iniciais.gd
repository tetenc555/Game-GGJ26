extends Control

#Código para carregar as vinhetas inciais do jogo

func _ready() -> void:
	pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
