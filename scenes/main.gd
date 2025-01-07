extends Node

var initial_scene:PackedScene = load("res://scenes/title-screen.tscn")
var title_screen_scene:PackedScene = load("res://scenes/title-screen.tscn")
var game_scene:PackedScene = load("res://scenes/game.tscn")

func _ready():
	go_to_title_screen()

func go_to_title_screen(score:=0):
	await get_tree().process_frame
	free_all_of_the_children()
	var instance := title_screen_scene.instantiate() 
	instance.action_key_was_pressed.connect(go_to_game.bind())
	add_child(instance)
	instance.score = score

func go_to_game():
	await get_tree().process_frame
	free_all_of_the_children()
	var instance := game_scene.instantiate()
	instance.game_over.connect(go_to_title_screen.bind())
	add_child(instance)

func free_all_of_the_children():
	for child in get_children():
		remove_child(child)
		child.queue_free()
