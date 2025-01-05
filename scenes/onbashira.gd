extends Node2D
@onready var animation_tree: AnimationTree = $Node/AnimationTree
@export var speed := -100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_tree.active = not Engine.is_editor_hint()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	position.x += speed * delta
