extends Node2D

onready var scene_changer = SceneChanger
onready var player = Global.Player

var dialogoChaveAtivo = false
var chavePrincipalNoInventario = false
var dialogoCofreAtivo = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if body == player:
		AudioHandler.play_sound_door()
		scene_changer.change_scene("res://Scenes/3_SalaDaMansao/SalaDaMansao.tscn")

func _input(delta):
	if get_node_or_null('DialogNode') == null:
		if dialogoCofreAtivo:
			if Global.senhaDoCofreNoInventario:
				Global.chamarDialogo("CofreAberto")
				Global.chaveDaPortaPrincipalDaMansaoNoInventario = true;
				dialogoCofreAtivo = false
			else:
				Global.chamarDialogo("CofreTrancado")
				dialogoCofreAtivo = false


func _on_cofre_body_entered(body):
	if body == player:
		dialogoCofreAtivo = true

func _on_cofre_body_exited(body):
	if body == player:
		dialogoCofreAtivo = false
