extends KinematicBody2D

export(int) var SPEED = 80
var direction = Vector2.ZERO

onready var scene_changer = SceneChanger
onready var player = Global.Player
onready var sprite = $Sprite
onready var colisor = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if player != null:
		direction = global_position.direction_to(player.global_position)
	var velocity = direction * SPEED
	velocity = move_and_slide(velocity)
	
	if direction == Vector2.ZERO:
		sprite.play("Idle")
	else:
		sprite.play("Run")
	
	if $Timer.time_left <= 0:
		$Ghost_walk.play()
		$Timer.start(3.5)
	
	sprite.flip_h = direction.x < 0
	
	if Global.senhaDoCofreNoInventario:
		colisor.disabled = true

func _on_ToqueGelido_body_entered(body):
	if body == player:
		Global.playerMorreu()
		scene_changer.change_scene("res://Scenes/GameOver/GameOver.tscn")
