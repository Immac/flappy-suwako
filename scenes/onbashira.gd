extends Node2D
@onready var animation_tree: AnimationTree = $Node/AnimationTree
@export var speed := -100
signal body_hit_hurtbox(body: Node2D)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_tree.active = not Engine.is_editor_hint()

func _physics_process(delta: float) -> void:
	position.x += speed * delta

func _on_hurt_box_body_entered(body: Node2D) -> void:
	body_hit_hurtbox.emit(body)
