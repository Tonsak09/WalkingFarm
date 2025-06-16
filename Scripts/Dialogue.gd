extends Node3D

@export var label : Label3D
@export var timer : Timer
@export var text : Array[String] 

var isTyping : bool 
var currLine : int 
var currChar : int 

func _ready() -> void:
	currLine = text.size(); 

func _process(delta: float) -> void:
	#print_debug( str(currLine) + " " + str(isTyping))
	timer.paused = !isTyping

func Interact():
	#print_debug(currLine and !isTyping)
	
	if !isTyping and currLine < text.size():
		label.text = ""
		currLine += 1
		currChar = 0
		isTyping = true
	elif isTyping:
		isTyping = false 
		label.text = text[currLine]
	else:
		StartTyping(); 

# Initializes the type system 
func StartTyping():
	if isTyping:
		return
	
	label.text = ""
	currChar = 0
	currLine = 0
	timer.start()
	isTyping = true

# Adds the next character to the label text 
func NextChar():
	
	if !isTyping:
		return
	
	# End of all dialogue 
	if currLine >= text.size():
		isTyping = false; 
		return 
	
	# End of current line 
	if currChar >= text[currLine].length():
		isTyping = false
		return
	 
	label.text += text[currLine][currChar]
	currChar += 1

func Cleanup():
	label.text = "";

func _input(event):
	pass 
	#if event.is_action_pressed("Interact"):
	#	StartTyping()
