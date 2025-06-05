extends MeshInstance3D

@export var cam : Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#look_at(cam.global_position, Vector3(0, 1, 0))
	pass
