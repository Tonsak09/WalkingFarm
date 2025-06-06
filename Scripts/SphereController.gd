extends Node3D

@export var radius : float
@export var speed : float 

@export var pitchRange : Vector2
@export var rollRange  : Vector2

var pitch : float
var roll : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pitch = 0
	roll = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Forward"):
		roll -= speed * delta
	elif Input.is_action_pressed("Backward"):
		roll += speed * delta
	
	if Input.is_action_pressed("Left"):
		pitch += speed * delta
	elif Input.is_action_pressed("Right"):
		pitch -= speed * delta
	
	pitch = clampf(pitch, pitchRange.x, pitchRange.y)
	roll = clampf(roll, rollRange.x, rollRange.y)
	
	transform.basis = Basis() # reset rotation
	rotate_object_local(Vector3(0, 0, 1), pitch) # first rotate in Y
	rotate_object_local(Vector3(1, 0, 0), roll) # then rotate in X
