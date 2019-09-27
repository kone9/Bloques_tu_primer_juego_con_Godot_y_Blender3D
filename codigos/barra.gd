extends KinematicBody

var movimiento = Vector3()#variable que se usa para mover la barra
export(float) var velocidad_barra = 20#esto es la velocidad inicial
export(float) var velocidad_inicial_Pelota = 40
export var velocidad_pelota_al_rebotar = 30#variable que aparece en el editor
var pelota

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()#esto crea una semilla para que el numero aleatorio sea diferente
	pelota = get_tree().get_nodes_in_group("pelota")[0]#busco a la pelota usando grupos

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):#funcion que se ejecuta 60 veces por segundo
	
	########################################################################
	#estos valores son para mover la barra usando los touch screen
	if Input.is_action_pressed("touch_izquierda"):#si presiono el touch screen izquierda
		movimiento.x = - velocidad_barra * delta #se mueve a la izquierda
	if Input.is_action_pressed("touch_derecha"):#si presiono el touch screen derecha
		movimiento.x = velocidad_barra * delta #se mueve a la derecha
	if Input.is_action_just_released("touch_derecha") or Input.is_action_just_released("touch_izquierda"):
		 movimiento.x = 0
	
	if Input.is_action_just_pressed("touch_start"):#si presiono el touch screen start
		lanzar_pelota()#lanzo la pelota
	#########################################################################
	
	##########################################################################
	#estos valores son para mover la barra usando el teclado
	if Input.is_action_pressed("a"):#si presiono la letra A
		movimiento.x = - velocidad_barra * delta #se mueve a la izquierda
	if Input.is_action_pressed("d"):#si presiono la letra D
		movimiento.x = velocidad_barra * delta #se mueve a la derecha
	#esto evita que se siga moviento
	if Input.is_action_just_released("a") or Input.is_action_just_released("d"):#si suelto la tecla A o D
		movimiento.x = 0
	
	if Input.is_action_just_pressed("Barra_espacio"):#si presiono la barra
		lanzar_pelota()
	####################################################################
	
	move_and_collide(movimiento)#esto permite mover y colisionar a un cuerpo kinematico
	

	
func lanzar_pelota():#esto es para lanzar la pelota
	var nodo_padre = get_parent()#busco al nodo padre de este script
	pelota.sleeping = false#activo las fisicas ya que si esta deshabilitado las fisicas no funcionan
	
	remove_child(pelota)#El nodo donde esta este script,busca a ese nodo y deja de ser hijo
	nodo_padre.add_child(pelota)#la pelota es hija del padre del nodo de la barra
	
	pelota.translation.x = self.translation.x #la pelota tiene la misma ubicación que la barra aunque sea arrojada
	pelota.linear_velocity.y = velocidad_inicial_Pelota#aplica una velocidad lineal en el eje y con fuerza de 40
	pelota.linear_velocity.x = rand_range(-30,30)#aplica una velocidad lineal aleatoria entre esos 2 valores en el eje x

		