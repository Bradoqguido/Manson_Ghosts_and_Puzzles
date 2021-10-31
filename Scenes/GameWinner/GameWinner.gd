extends CanvasLayer

onready var scene_changer = SceneChanger

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_novo_pressed():
	scene_changer.change_scene("res://Scenes/1_Porao/Porao.tscn")


func _on_sair_pressed():
	get_tree().quit()
