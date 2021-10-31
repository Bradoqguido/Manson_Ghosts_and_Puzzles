extends CanvasLayer

onready var scene_changer = SceneChanger

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Button_pressed():
	scene_changer.change_scene("res://Scenes/1_Porao/Porao.tscn")
	#get_tree().change_scene("res://Scenes/3_SalaDaMansao/SalaDaMansao.tscn")
