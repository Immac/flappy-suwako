extends Node2D

signal game_over(score:int)

func on_game_ended():
   game_over.emit(100)
