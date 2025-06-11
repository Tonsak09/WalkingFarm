extends TextureRect

@export var tabOnHover : Texture2D
@export var tabOffHover : Texture2D

var isHovering : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func swapHover() -> void:
	isHovering = !isHovering
	texture = tabOnHover
	print_debug("test")
