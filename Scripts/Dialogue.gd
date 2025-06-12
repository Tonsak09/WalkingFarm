extends Node3D

@export var label : Label3D
@export var timer : Timer
@export var text : String

var isTyping : bool 
var currChar : int 

func Interact():
	StartTyping(); 

# Initializes the type system 
func StartTyping():
	if isTyping:
		return
	
	label.text = ""
	currChar = 0
	timer.start()
	isTyping = true

# Adds the next character to the label text 
func NextChar():
	if currChar >= text.length():
		isTyping = false
		return
	 
	label.text += text[currChar]
	currChar += 1

func Cleanup():
	label.text = "";

func _input(event):
	pass 
	#if event.is_action_pressed("Interact"):
	#	StartTyping()
