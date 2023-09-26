extends AnimatedSprite2D


func _ready():
	play("default")


func animation_finished():
	queue_free()
