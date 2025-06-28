extends Node3D

@export var player : Node3D
@export var root : Node3D
@export var renderer : Node3D
@export var commonHeight : float
@export var heldHeight : float 
@export var releaseTimer : Timer 
@export var interactTimer : Timer

var canRelease : bool 
var canInteract : bool 
var held : bool

# If interacting held than copy the root rotation of the player but be slighty
# above and on its head 

func _init() -> void:
	held = false 
	canInteract = true 
	canRelease = true 

func _process(delta: float) -> void:
	#print_debug(canRelease)
	if held:
		root.rotation = player.rotation 
		renderer.position.y = heldHeight
		
		if canRelease && Input.is_action_just_pressed("Interact"):
			canInteract = false 
			interactTimer.start()
			held = false
			if !player.isInStillZone:
				root.canMove = true
	else:
		renderer.position.y = commonHeight

# When near the plant and activated 
func Interact():
	
	if !canInteract || held:
		return 
	
	root.canMove = false 
	root.rotation = player.rotation
	releaseTimer.start()
	canRelease = false 
	held = true 
	

func Cleanup():
	pass 

func CanRelease():
	canRelease = true

func CanInteract():
	canInteract = true 
