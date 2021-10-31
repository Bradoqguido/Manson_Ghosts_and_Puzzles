extends Node2D

onready var scene_changer = SceneChanger
onready var player = Global.Player
onready var chaveDaPortaPrincipalDaMansaoNoInventario = Global.chaveDaPortaPrincipalDaMansaoNoInventario
onready var peDeCabraNoInventario = Global.peDeCabraNoInventario

var dialogoAtivo = false
var dialogo = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(delta):
	if get_node_or_null('DialogNode') == null:
		if dialogoAtivo:
			Global.chamarDialogo(dialogo)
			dialogoAtivo = false

func _on_PortaQuarto_body_entered(body):
	if body == player:
		dialogo = "UsarPeDeCabraNoQuarto"
		dialogoAtivo = true
		#AudioHandler.play_sound_door()
		scene_changer.change_scene("res://Scenes/4_Quarto/Quarto.tscn")

func _on_PortaQuarto_body_exited(body):
	if body == player:
		pass # Replace with function body.

func _on_PortaEscritorio_body_entered(body):
	if body == player:
		#AudioHandler.play_sound_door()
		scene_changer.change_scene("res://Scenes/5_Escritorio/Escritorio.tscn")

func _on_PortaBanheiro_body_entered(body):
	if body == player:
		#AudioHandler.play_sound_door()
		scene_changer.change_scene("res://Scenes/6_Banheiro/Banheiro.tscn")

func _on_PortaSaida_body_entered(body):
	if body == player:
		#AudioHandler.play_sound_door()
		scene_changer.change_scene("res://Scenes/GameWinner/GameWinner.tscn")
		if chaveDaPortaPrincipalDaMansaoNoInventario:
			scene_changer.change_scene("res://Scenes/GameWinner/GameWinner.tscn")
		else:
			dialogo = "SemChaveDaDaPortaPrincipal"
			dialogoAtivo = true

func _on_PortaSaida_body_exited(body):
			dialogoAtivo = false
func _on_PortaPorao_body_entered(body):
	if body == player:
		#AudioHandler.play_sound_door()
		scene_changer.change_scene("res://Scenes/1_Porao/Porao.tscn")
