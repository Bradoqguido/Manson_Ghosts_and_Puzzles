extends Node2D

onready var Player = null
onready var midNight = false
onready var chaveDaPortaPrincipalDaMansaoNoInventario = false

func _on_Timer_timeout():
	midNight = true
