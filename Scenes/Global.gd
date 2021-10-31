extends Node2D

onready var Player = null
onready var chaveDaPortaPrincipalDaMansaoNoInventario = false
onready var peDeCabraNoInventario = false
onready var senhaDoCofreNoInventario = false
onready var chaveDoEscritorioNoInventario = false
onready var poraoTrancado = true

var player_position = null

func chamarDialogo(dialogo): # Passar o nome do dialogo que você quer executar.
	get_tree().paused = true # Não esquecer de colocar essa linha na função "on_<objeto>_body_exited" com o valor "false" para despausar o game.
	var dialog = Dialogic.start(dialogo)
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end', self, 'unpause')
	add_child(dialog)

func unpause(timeline_name):
	get_tree().paused = false

func playerMorreu():
	chaveDaPortaPrincipalDaMansaoNoInventario = false
	peDeCabraNoInventario = false
	senhaDoCofreNoInventario = false
	chaveDoEscritorioNoInventario = false
	poraoTrancado = true
