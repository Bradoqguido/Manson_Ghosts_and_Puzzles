extends Node2D

onready var scene_changer = SceneChanger
onready var player = Global.Player

var dialogoChaveAtivo = false
var chaveNoInventario = false

var dialogoPeDeCabraAtivo = false
var peDeCabraNoInventario = false
var dialogoPoraoTrancado = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	AudioHandler.stop_music_menu()

func _input(delta):
	if get_node_or_null('DialogNode') == null:
		if dialogoChaveAtivo && Global.poraoTrancado:
			Global.chamarDialogo("ChaveDoPorao")
			Global.poraoTrancado = false
			dialogoChaveAtivo = false
		if Global.poraoTrancado && dialogoPoraoTrancado:
			Global.chamarDialogo("PoraoTrancado")
			dialogoPoraoTrancado = false

func _on_Chave_body_entered(body):
	if body == player:
		dialogoChaveAtivo = true
		chaveNoInventario = true

func _on_Chave_body_exited(body):
	if body == player:
		dialogoChaveAtivo = false

func _on_Porta_body_entered(body):
	if body == player:
		if !Global.poraoTrancado:
			AudioHandler.play_sound_door()
			scene_changer.change_scene("res://Scenes/3_SalaDaMansao/SalaDaMansao.tscn")
		else:
			dialogoPoraoTrancado = true
