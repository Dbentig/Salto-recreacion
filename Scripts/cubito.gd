extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	# gravedad.
	if not is_on_floor():
		velocity.y -= 7 * 10 * delta
	else:
		velocity.y = 0
		#Salto (juego)
		if Input.get_action_strength("salto"):
			velocity.y = 30
	 

		

	# inputs de movimiento.

	var direction := Vector3.ZERO
	var input_x = Input.get_action_strength("derecha") - Input.get_action_strength("izquierda")
	var input_z = Input.get_action_strength("abajo") - Input.get_action_strength("arriba")
	direction.x = input_x
	direction.z = input_z
	var dash = true
	var dash_speed = 40
	var dash_cooldown = 2.0
	var dash_duration = 0.2
	var dashing = false	


	if direction.length() > 0:
		#rotacion
		direction = direction.normalized()
		var objetivo := atan2(direction.x, direction.z)
		rotation.y = lerp_angle(rotation.y, objetivo, 0.1)
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	if Input.is_action_just_pressed("dash") and dash:
		dash = false
		dashing = true
		velocity = direction * dash_speed
		await get_tree().create_timer(dash_duration).timeout
		dashing = false
		await get_tree().create_timer(dash_cooldown).timeout
		dash = true
		
		
		
		

	move_and_slide()
