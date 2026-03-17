extends Node3D

@export var objetivo: Node3D  # arrastra aquí tu Jugador
@export var offset: Vector3 = Vector3(0, 8, 1.2)
@export var suavizado: float = 0.15

func _physics_process(delta):
	if objetivo != null:
		var target_pos = objetivo.global_transform.origin + offset
		global_transform.origin = global_transform.origin.lerp(target_pos, suavizado)
