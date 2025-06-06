extends Node3D

@export var cam : Node3D
@export var root : Node3D
@export var tree : PackedScene
@export var xRotRange : Vector2
@export var zRotRange : Vector2

func _ready() -> void:
	randomize()

func SpawnEntity():
	var toSpawn = tree.instantiate()
	toSpawn.Init(cam)
	toSpawn.rotate_x(lerp(xRotRange.x, xRotRange.y, randfn(0.0, 1.0)))
	toSpawn.rotate_z(lerp(zRotRange.x, zRotRange.y, randfn(0.0, 1.0)))
	root.add_child(toSpawn)
