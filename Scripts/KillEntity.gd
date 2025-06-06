extends Node

@export var timer : Timer
@export var mesh : MeshInstance3D
@export var character : Node3D
@export var curve : Curve
@export var killDis : float 

var activated : bool 
var isReady : bool 


func Activate():
	timer.start()
	activated = true 

func Cleanup():
	queue_free()

func _ready() -> void:
	#Activate()
	isReady = true 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if activated:
		mesh.material_override.set_shader_parameter("breakLerp", curve.sample(1.0 - (timer.time_left / timer.wait_time)) )
	elif  character.cam != null:
		var dis = (character.global_position - character.cam.global_position).length_squared()
		if (dis <= killDis):
			Activate()
