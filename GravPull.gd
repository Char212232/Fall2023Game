extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position = Vector2(960, 540)
	get_node("CollisionShape2D").position = Vector2(0, 0)
	get_node("Sprite2D").position = Vector2(0, 0)
