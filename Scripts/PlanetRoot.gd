extends Node3D

@export var speed : float 

func Init(target : Node3D):
	$Character.cam = target
	$Character.initiated = true 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_x(delta * speed)
