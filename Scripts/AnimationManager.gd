extends AnimatedSprite3D

@export var controller : Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("Run")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var isMoving = false 
	if Input.is_action_pressed("Left"):
		isMoving = true
		scale.x = 0.1
	elif Input.is_action_pressed("Right"):
		isMoving = true 
		scale.x = -0.1
	
	
	
	if Input.is_action_pressed("Forward") || Input.is_action_pressed("Backward"):
		isMoving = true 
	
	if isMoving:
		play("Run")
	else:
		play("Idle")
