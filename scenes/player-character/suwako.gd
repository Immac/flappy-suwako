extends CharacterBody2D

const JUMP_VELOCITY = -400.0

@export var auto_flap := true
var do_jump := false

var falling := false:
   get:
      return velocity.y < 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var tree := $Animations/Tree as AnimationTree
@onready var state_machine := tree["parameters/playback"] as AnimationNodeStateMachinePlayback
var falling_path := "parameters/conditions/falling"

func _ready():
   state_machine.start("Flap")

func _physics_process(delta):
   # Add the gravity.
   if not is_on_floor():
      velocity.y += gravity * delta
   # Handle Jump.
   if do_jump:
      velocity.y = JUMP_VELOCITY
      do_jump = false
   auto_jump()
   move_and_slide()

func _input(event:InputEvent):
   do_jump = event.is_action_pressed("action-key") || (event is InputEventScreenTouch and event.is_pressed())



func auto_jump():
   if auto_flap:
      do_jump = global_position.y >= get_viewport().get_visible_rect().size.y/2

