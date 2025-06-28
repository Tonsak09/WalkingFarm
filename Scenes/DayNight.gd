extends Node3D

@export var rotateSpeed : float 
@export var dirLight : DirectionalLight3D
@export var dayColor : Color
@export var nightColor : Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(rotateSpeed * delta)
	
	dirLight.light_color = lerp(dayColor, nightColor, inverse_lerp(0, PI, abs(rotation.y)))
