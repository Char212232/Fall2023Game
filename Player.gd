# Player.gd
extends RigidBody2D

var speed : float = 400

func _process(delta):
	process_input(delta)

func process_input(_delta):
	var direction = Vector2()

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	apply_movement(direction)

func apply_movement(direction):
	var velocity = direction.normalized() * speed
	linear_velocity = velocity


func _on_grav_pull_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	var direction = Vector2()
	direction.y = 1000000
	apply_movement(direction)
