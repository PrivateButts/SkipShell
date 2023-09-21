extends CharacterBody2D

const SPEED = 200


func _ready():
	print(rotation)
	velocity = Vector2.UP.rotated(rotation) * SPEED


func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
		look_at(transform.origin+velocity)
		rotate(1.5708) # 90 deg offset
		
