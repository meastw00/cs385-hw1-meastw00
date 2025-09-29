extends Node2D

const SPEED = 60
const GRAVITY = 3

var direction = 1
var accel = 0

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right_ground: RayCast2D = $RayCastRightGround
@onready var ray_cast_left_ground: RayCast2D = $RayCastLeftGround
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !ray_cast_left_ground.is_colliding() && !ray_cast_right_ground.is_colliding():
		position.y += GRAVITY * accel * delta
		if accel >= GRAVITY * 20:
			accel = GRAVITY * 20
		else:
			accel += GRAVITY
	elif ray_cast_right.is_colliding() || !ray_cast_right_ground.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	elif ray_cast_left.is_colliding() || !ray_cast_left_ground.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += direction * SPEED * delta
