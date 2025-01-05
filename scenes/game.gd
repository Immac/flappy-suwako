extends Node2D

signal game_over(score:int)

@onready var suwako: CharacterBody2D = $Suwako

func _ready() -> void:
	pass
	
func on_game_ended() -> void:
	game_over.emit(100)


func _on_onbashira_body_hit_hurtbox(body: Node2D) -> void:
	if body == suwako:
		on_game_ended()
