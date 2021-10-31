extends KinematicBody2D

onready var player = Global.Player
onready var peDeCabraNoInventario = Global.peDeCabraNoInventario

var dialogoAtivo = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(delta):
	if get_node_or_null('DialogNode') == null:
		if dialogoAtivo:
			peDeCabraNoInventario = true
			Global.chamarDialogo("ChaveDoPorao")
			$CollisionShape2D.hide()
			dialogoAtivo = false

func _on_PegarPeDeCabra_body_entered(body):
	if body == player:
		dialogoAtivo = true

func _on_PegarPeDeCabra_body_exited(body):
	if body == player:
		dialogoAtivo = false
