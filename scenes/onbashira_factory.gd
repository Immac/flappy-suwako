extends Marker2D

const ONBASHIRA:PackedScene = preload("res://scenes/onbashira.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	$Path2D/PathFollow2D.progress_ratio = lerpf($Path2D/PathFollow2D.progress_ratio,target,delta * 1)

var target := 0.5
func create_onbashira():
	var new_onbashira := ONBASHIRA.instantiate()
	new_onbashira.global_position = $Path2D/PathFollow2D.global_position
	target = randf()
	$"..".add_child(new_onbashira)
	new_onbashira.add_to_group("Obstacles")
	pass 

func _on_creation_timer_timeout() -> void:
	create_onbashira()
