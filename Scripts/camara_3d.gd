extends Node3D

@export var objetivo: Node3D 
var distance = Vector3(0.0, 8.0, 1.2)
var distance_multipler = 1
@export var suavizado: float = 0.15

func _physics_process(_delta: float):
	var offset: Vector3 = Vector3(distance * distance_multipler)
	if Input.get_action_strength("camara+"):
		distance_multipler += 0.05
	if Input.get_action_strength("camara-"):
		distance_multipler -= 0.05
	if objetivo != null:
		var target_pos = objetivo.global_transform.origin + offset
		global_transform.origin = global_transform.origin.lerp(target_pos, suavizado)
	if Input.get_action_strength("camara+"):
		distance_multipler += 0.02
	if Input.get_action_strength("camara-"):
		distance_multipler -= 0.02
	
