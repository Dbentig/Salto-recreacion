extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	var direction := Vector3.ZERO
	var input_x = Input.get_action_strength("derecha") - Input.get_action_strength("izquierda")
	var input_z = Input.get_action_strength("abajo") - Input.get_action_strength("arriba")
	direction.x = input_x
	direction.z = input_z

	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	if direction.length() > 0:
		direction = direction.normalized()
		var objetivo := atan2(direction.x, direction.z)
		rotation.y = lerp_angle(rotation.y, objetivo, 0.1)

	move_and_slide()
