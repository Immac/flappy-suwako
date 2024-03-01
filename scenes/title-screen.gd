extends Node2D

@export var game_scene:PackedScene = load("res://scenes/game.tscn")
@export var score:int = 0:
   set(value):
      score = value
      if score_value_label != null:
         score_value_label.text = str(score)

signal action_key_was_pressed()

@onready var score_value_label :Label = %ScoreValueLabel

func _input(event:InputEvent):

   if event.is_action_pressed("action-key"):
      action_key_was_pressed.emit()
   if event is InputEventScreenTouch and event.is_pressed():
      action_key_was_pressed.emit()
