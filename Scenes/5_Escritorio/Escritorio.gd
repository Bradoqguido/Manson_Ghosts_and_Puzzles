extends Node2D

onready var scene_changer = SceneChanger
onready var player = Global.Player

varDialogoChaveAtivo = false
varChavePrincipalNoInventario = false

varDialogoCofreAtivo = false
varSenhaCofreNoInventario = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	scene_changer.change_scene("res://Scenes/3_SalaDaMansao/SalaDaMansao.tscn")
