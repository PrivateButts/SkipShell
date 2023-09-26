extends Area2D

@export var LIFE = 1


func _on_body_entered(body:Shell):
	LIFE -= 1;
	if LIFE < 1:
		die()
	else:
		# Calc normal
		var space_state = get_world_2d().direct_space_state
		# use global coordinates, not local to node
		var query = PhysicsRayQueryParameters2D.create(transform.origin, body.transform.origin)
		query.exclude.append($Area2D.get_rid())
		var result = space_state.intersect_ray(query)
		body.force_bounce.emit(result['normal'])


func die():
	queue_free()
