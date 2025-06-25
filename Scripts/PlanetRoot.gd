extends Node3D

@export var speed : float 
var canMove = true

func Init(target : Node3D):
	$Character.cam = target
	$Character.initiated = true 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if canMove:
		rotate_x(delta * speed)
