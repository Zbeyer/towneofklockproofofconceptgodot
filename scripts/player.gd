extends CharacterBody2D

const SPEED = 120.0

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.

	# Get the input direction -1 or 1
	var directionX = Input.get_axis("move_left", "move_right")
	var directionY = Input.get_axis("move_up", "move_down")
	
	if directionX:
		velocity.x = directionX * SPEED
		if directionX > 0:
			animated_sprite_2d.play("walk_east")
		if directionX < 0:
			animated_sprite_2d.play("walk_west")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#animated_sprite_2d.play("idles")

	if directionY:
		velocity.y = directionY * SPEED
		if directionY < 0:
			animated_sprite_2d.play("walk_north")
		if directionY > 0:
			animated_sprite_2d.play("walk_south")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		#animated_sprite_2d.play("idles")
		
	move_and_slide()
