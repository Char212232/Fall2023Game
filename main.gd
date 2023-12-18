extends Node2D

@onready var viewport1 = get_node("Viewports/TopLeft/SubViewport")
@onready var viewport2 = get_node("Viewports/TopRight/SubViewport")
@onready var camera1 = get_node("Viewports/TopLeft/SubViewport/Camera2D")
@onready var camera2 = get_node("Viewports/TopRight/SubViewport/Camera2D")
var scene = load("res://minigame_gravity.tscn")

func _ready():
	pass
	#viewport1.add_child(scene)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
