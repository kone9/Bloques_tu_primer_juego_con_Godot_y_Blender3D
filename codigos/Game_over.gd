extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_just_pressed("touch_start"):
		get_tree().change_scene("res://escenas/presione_click.tscn")#esto carga denuevo el menu de inicio
	if Input.is_action_just_pressed("click_izquierdo"):
		get_tree().change_scene("res://escenas/presione_click.tscn")#esto carga denuevo el menu de inicio
		
	
func _on_Timer_timeout():#Si termino el tiempo
	get_tree().change_scene("res://escenas/presione_click.tscn")#esto carga denuevo el menu de inicio
