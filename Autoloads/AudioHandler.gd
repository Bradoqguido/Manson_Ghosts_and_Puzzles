extends Node

var titlescr = load("res://Musics/Musica_Menu.wav")
var doorsound = load("res://Sound_Efects/Porta.wav")
var looting = load("res://Sound_Efects/Looting.ogg")

func _ready():
	pass

# Function for the title screen scene
func play_music_menu():
	$Musica_Menu.stream = titlescr
	$Musica_Menu.play()
func stop_music_menu():
	$Musica_Menu.stop()

# Function for the dor sound efect
func play_sound_door():
	$Efeito_Porta.stream = doorsound
	$Efeito_Porta.play()

#Function for looting
func play_loot():
	$Loot.stream = looting
	$Loot.play()
