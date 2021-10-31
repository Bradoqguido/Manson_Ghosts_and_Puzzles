extends KinematicBody2D

onready var player = Global.Player
onready var peDeCabraNoInventario = Global.peDeCabraNoInventario

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_PegarPeDeCabra_body_entered(body):
	if body == player:
		peDeCabraNoInventario = true
		$CollisionShape2D.hide()
