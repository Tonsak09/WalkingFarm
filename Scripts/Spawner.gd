extends Node3D

@export var cam : Node3D
@export var root : Node3D
@export var tree : PackedScene
@export var xRotMeanAndDev : Vector2
@export var zRotMeanAndDev : Vector2

func _ready() -> void:
	randomize()

func SpawnEntity():
	var toSpawn = tree.instantiate()
	toSpawn.Init(cam)
	toSpawn.rotate_x(randfn(xRotMeanAndDev.x, xRotMeanAndDev.y))
	toSpawn.rotate_z(randfn(zRotMeanAndDev.x, zRotMeanAndDev.y))
	
	root.add_child(toSpawn)
