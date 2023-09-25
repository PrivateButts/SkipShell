extends CharacterBody2D

const SPEED = 500
const MAX_DISTANCE = pow(10000,2)
@export var EXPLOSION_EFFECT: PackedScene

@onready var CENTER = get_viewport_rect().size / 2


func _ready():
	velocity = Vector2.UP.rotated(rotation) * SPEED


func _physics_process(delta):
	if position.distance_squared_to(CENTER) > MAX_DISTANCE:
		kill(position)
		return
		
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
		look_at(transform.origin+velocity)
		rotate(1.5708) # 90 deg offset


func kill(pos: Vector2):
	var explosion = EXPLOSION_EFFECT.instantiate() as AnimatedSprite2D
	explosion.position = pos
	self.add_sibling(explosion)
	queue_free()
