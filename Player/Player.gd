extends KinematicBody2D


# Declare member variables here. Examples:
export(int) var SPEED = 90
var peso = 1
var peso_maximo = 2
var direction = Vector2.ZERO

onready var sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.Player = self

func _physics_process(delta):
	var input = Vector2.ZERO # input do usuário
	
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	direction = input.normalized()
	direction =  move_and_slide(direction * SPEED)
	
	if direction == Vector2.ZERO:
		sprite.play("Idle")
	else:
		sprite.play("Run")
	
	sprite.flip_h = direction.x < 0

