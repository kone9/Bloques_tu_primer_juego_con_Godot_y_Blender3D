extends Spatial

export(PackedScene) var escena_1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_pressed("click_izquierdo"):#si presiono click izquierdo
		get_tree().change_scene("res://escenas/Escena_principal.tscn")#cambio de escena
		#get_tree().change_scene_to(escena_1)#con esto cambio la escena
	if Input.is_action_just_pressed("touch_start"):
		get_tree().change_scene("res://escenas/Escena_principal.tscn")#cambio de escena
