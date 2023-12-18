# Player.gd
extends RigidBody2D

var speed : float = 300

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

	# Apply your movement logic here
	apply_movement(direction)
	# Gravitational pull logic
	var gravPull = get_node("../GravPull")
	var directionToGravPull = (gravPull.global_position - global_position).normalized()
	var distanceToGravPull = global_position.distance_to(gravPull.global_position)
	# Adjust the gravitational pull strength based on the distance
	var maxPullStrength = 400.0
	var minPullStrength = 200.0
	var distanceFactor = distanceToGravPull
	
	# Apply the gravitational pull as a force or velocity
	var finalforce = directionToGravPull * clamp(minPullStrength + distanceFactor * maxPullStrength, minPullStrength, maxPullStrength)
	finalforce = finalforce*10
	apply_force(finalforce, Vector2(0,0))

func apply_movement(direction):
	var velocity = direction.normalized() * speed
	linear_velocity = velocity


func _on_grav_pull_body_entered(_body):
	#get_node("../label_died").visible=true
	var vxd = sign(linear_velocity.x)
	var vyd = sign(linear_velocity.y)
	linear_velocity = Vector2(vxd*1000,vyd*1000)
	
