extends Node3D

@export var interactbale : Node 

var inRange : bool 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("Interact") && inRange:
		interactbale.Interact()
	elif !inRange:
		interactbale.Cleanup()

# Near target 
func Initiate(area : Area3D):
	inRange = true 
	
func Leave(area : Area3D):
	inRange = false 
