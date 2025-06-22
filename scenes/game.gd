extends Node2D

signal game_over(score:int)

@onready var suwako: CharacterBody2D = $Suwako

func _ready() -> void:
	pass
	
func on_game_ended() -> void:
	game_over.emit(0)
	
func _on_suwako_died(killer: Node2D) -> void:
	on_game_ended()
