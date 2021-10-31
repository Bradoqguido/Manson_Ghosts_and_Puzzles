extends Node2D

onready var scene_changer = SceneChanger
onready var player = Global.Player

var dialogoChaveAtivo = false
var chaveNoInventario = false

var dialogoPeDeCabraAtivo = false
var peDeCabraNoInventario = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(delta):
	if get_node_or_null('DialogNode') == null:
		if dialogoChaveAtivo:
			get_tree().paused = true
			var dialog = Dialogic.start('ChaveDoPorao')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)


func unpause(timeline_name):
	get_tree().paused = false
	dialogoChaveAtivo = false

func _on_Area2D_body_entered(body):
	if body == player:
		if chaveNoInventario:
			scene_changer.change_scene("res://Scenes/3_SalaDaMansao/SalaDaMansao.tscn")

func _on_Chave_body_entered(body):
	if body == player:
		dialogoChaveAtivo = true
		chaveNoInventario = true

func _on_Chave_body_exited(body):
	if body == player:
		dialogoChaveAtivo = false
