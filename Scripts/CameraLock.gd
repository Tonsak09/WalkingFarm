extends MeshInstance3D

@export var cam : Node3D
@export var initiated : bool 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if initiated:
		look_at(cam.global_position, global_position, true)
