extends CharacterBody2D
const JUMP_VELOCITY := -400.0
const MAX_FALL_SPEED := 1200
@export var auto_flap := true
@export var objects_that_hurt_group_name := "Obstacles"
@onready var tree := $Animations/Tree as AnimationTree
@onready var state_machine := tree["parameters/playback"] as AnimationNodeStateMachinePlayback

var do_jump := false
var falling := false:
	get:
		return velocity.y < 0
var controllable = true
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
signal died(killer: Node2D)

func _ready():
	tree.active = not Engine.is_editor_hint()
	state_machine.start("Flap")

func _physics_process(delta):
   # Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
   # Handle Jump.
	if do_jump:
		velocity.y = JUMP_VELOCITY
		do_jump = false
	velocity.y = clamp(velocity.y,JUMP_VELOCITY,MAX_FALL_SPEED)
	auto_jump()
	move_and_slide()

func _input(event:InputEvent):
	var action_pressed = event.is_action_pressed("action-key") 
	var screen_touched = event is InputEventScreenTouch and event.is_pressed()
	do_jump = do_jump or action_pressed or screen_touched

func auto_jump():
	if auto_flap:
		do_jump = global_position.y >= get_viewport().get_visible_rect().size.y/2

func _on_hurt_box_body_entered(body: Node2D) -> void:
	if body.is_in_group(objects_that_hurt_group_name):
		died.emit(body)
