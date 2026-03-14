extends CharacterBody2D

func _physics_process(delta):
	movimiento_cubito(delta)
	
 
func movimiento_cubito(delta):
	var direccion = Vector2()
	var velocidad = 400
	if Input.get_action_strength("sprint"):
		velocidad = 700
	
	direccion.x = Input.get_action_strength("derecha") - Input.get_action_strength("izquierda")
	direccion.y = Input.get_action_strength("abajo") - Input.get_action_strength("arriba")
	velocity = direccion.normalized() * velocidad
	
	if direccion != Vector2.ZERO:
		rotation = lerp_angle(rotation, direccion.angle(), 0.2)
	move_and_slide()
