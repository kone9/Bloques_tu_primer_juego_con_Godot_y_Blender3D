extends Spatial

var pelota
var puntaje = 0 #esta variable es para sumar el puntaje
var vidas = 3 #esta variable representa las vidas
export(PackedScene) var particulas #guardo la escena particulas para recargarla
var todas_las_particulas = []#variable de tipo arreglo

# Called when the node enters the scene tree for the first time.
func _ready():
	pelota = get_tree().get_nodes_in_group("pelota")[0]
	#posicion_particulas = get_tree().get_nodes_in_group("pelota")[0]
	pass # Replace with function body.


func _process(delta):
	todas_las_particulas = $particulas.get_children()

	if todas_las_particulas != null:#mira si todas las particulas es distinto de Null
		for i in todas_las_particulas:#recorro la lista de objetos
			if i.emitting == false:#verifico si las particulas no se estan emitiendo
				i.queue_free()#elimino la particula"""
			
			


func _on_area_para_eventos_body_entered(body_pelota):#si entra un cuerpo al suelo
	if body_pelota.is_in_group("pelota"):#si ese cuerpo esta en el grupo pelota
		var barra = get_tree().get_nodes_in_group("barra")[0]#esto busca la barra
				
		#esto reposiciona la pelota a su estado inicial
		body_pelota.translation.x = 0#reposiciono la pelota a 0 en "X"
		body_pelota.translation.y = 2#reposiciono la pelota en 2 en el eje "Y"
		body_pelota.linear_velocity.y = 0#deja de tener un impulso lineal en el eje "Y"
		body_pelota.linear_velocity.x = 0#deja de tener un impulso lineal en el eje "X"
		body_pelota.sleeping = true#hace que la pelota no sea afectado por las físicas
		
		barra.translation.x = 0#reposiciono a la barra en 0 en "X"#"""
		
			
		#esto hace que cambie la gerarquia reparando el BUG
		var objetos_hijos = get_child(0).get_children()#BUSCO los hijos del nodo barra_pelota_pared
		for i in objetos_hijos: #recorro esa lista de nodos
			if i.name == "pelota":#si hay un nodo que se llama pelota
				get_child(0).remove_child(body_pelota)#esto hace que la pelota deje de ser hijo de este nodo
				barra.add_child(body_pelota)#hago que la pelota vuelva a ser hijo de la barra para que se muevan juentos"""
				#Esto esta relacionado a las vidas		
				vidas -= 1 #resta 1 vida cada ves que morimos
				$Inteface/vidas.text = "vidas = " + str(vidas)
				if vidas > 0:
					$music_and_vfx/morir.play()
				if vidas == 0:# si vidas llego a cero
					$music_and_vfx/perdiste.play()#activa el sonido perdiste
					get_tree().change_scene("res://escenas/Game_over.tscn")#esto cambia la escena
				
		#esto es para las vidas

		

func _on_pelota_body_entered(body):#si la pelota choca con un cuerpo
	if body.is_in_group("bloque"):#si el cuerpo esta en el grupo bloques
		$music_and_vfx/point.play()#activa sonido point	
		body.queue_free()#elimino el bloque colisionado
		puntaje += 1 #sumo 1 punto cada ves que colisiona con un bloque
		$Inteface/puntaje.text = "Puntaje = " + str(puntaje) #cambio el texto para mostrar el puntaje por pantalla 
		
		#esto es relacionado a las particulas cuando se destruye el bloque
		var particulas_instanciadas = particulas.instance()#creo una instancia de las particulas
		$particulas.add_child(particulas_instanciadas)#agrego como nodo hijo las particulas
		particulas_instanciadas.translation = pelota.translation #las particulas tiene la misma posición que el nodo 3D position
		particulas_instanciadas.emitting = true #hace que esta particula instanciada este emitiendo"""
		
		#relacionado a ganar
		if puntaje == 42:#si el puntaje es igual a 35 se destruyeron todos los bloques pasar al nivel winner
			get_tree().change_scene("res://escenas/Winner_juego.tscn")
		
		
	if body.is_in_group("barra"):#si egolpea con la barra
		pelota.linear_velocity.y = $barra_pelota_pared/barra.velocidad_pelota_al_rebotar#al revotar busco la variable que se encuentra en el otro nodo y aplico una fuerza
		$music_and_vfx/rebote.play()
	if body.is_in_group("paredes"):#si egolpea con la barra
		$music_and_vfx/rebote.play()