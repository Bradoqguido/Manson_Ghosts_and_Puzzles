extends Node2D

onready var scene_changer = SceneChanger
onready var player = Global.Player
onready var chaveDaPortaPrincipalDaMansaoNoInventario = Global.chaveDaPortaPrincipalDaMansaoNoInventario

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_PortaQuarto_body_entered(body):
	if body == player:
		scene_changer.change_scene("res://Scenes/4_Quarto/Quarto.tscn")

func _on_PortaEscritorio_body_entered(body):
	if body == player:
		scene_changer.change_scene("res://Scenes/5_Escritorio/Escritorio.tscn")

func _on_PortaBanheiro_body_entered(body):
	if body == player:
		scene_changer.change_scene("res://Scenes/6_Banheiro/Banheiro.tscn")

func _on_PortaSaida_body_entered(body):
	if body == player:
		if chaveDaPortaPrincipalDaMansaoNoInventario:
			scene_changer.change_scene("res://Scenes/GameWinner/GameWinner.tscn")

func _on_PortaPorao_body_entered(body):
	if body == player:
		scene_changer.change_scene("res://Scenes/1_Porao/Porao.tscn")
