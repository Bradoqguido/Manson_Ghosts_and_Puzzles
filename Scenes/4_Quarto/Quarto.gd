extends Node2D

onready var scene_changer = SceneChanger
onready var player = Global.Player

var dialogoChaveEscritorio = false;
var dialogoLivro = false;
var dialogoArmarioComSangue = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	AudioHandler.play_sound_door()
	scene_changer.change_scene("res://Scenes/3_SalaDaMansao/SalaDaMansao.tscn")

func _input(delta):
	if get_node_or_null('DialogNode') == null:
		if dialogoChaveEscritorio:
			if !Global.chaveDoEscritorioNoInventario:
				Global.chamarDialogo("ChaveEscritorio")
				Global.chaveDoEscritorioNoInventario = true
				dialogoChaveEscritorio = false
				
		if dialogoLivro:
			if !Global.senhaDoCofreNoInventario:
				Global.chamarDialogo("LivroComSenhaDoCofre")
				Global.senhaDoCofreNoInventario = true
				dialogoLivro = false
		
		if dialogoArmarioComSangue:
			Global.chamarDialogo("ArmarioComSangue")
			dialogoArmarioComSangue = false;


func _on_armario2_body_entered(body):
	if body == player:
		dialogoChaveEscritorio = true


func _on_armario2_body_exited(body):
	if body == player:
		dialogoChaveEscritorio = false


func _on_livro_body_entered(body):
	if body == player:
		dialogoLivro = true


func _on_livro_body_exited(body):
	if body == player:
		dialogoLivro = false


func _on_armario1_body_entered(body):
	if body == player:
		dialogoArmarioComSangue = true


func _on_armario1_body_exited(body):
	if body == player:
		dialogoArmarioComSangue = false
