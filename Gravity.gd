# GravityPoint.gd
extends Area2D

# Exported variable for gravity strength

@export var gravityStrength : float = 500

# _process(delta) function is called every frame
func _process(_delta):
	for body in get_overlapping_bodies():
		apply_gravity(body)

# Function to apply gravitational force to a body
func apply_gravity(body):
	var direction = (global_position - body.global_position).normalized()
	var distance = global_position.distance_to(body.global_position)
	var force = gravityStrength / distance

	body.apply_force_to_center(-direction * force)
