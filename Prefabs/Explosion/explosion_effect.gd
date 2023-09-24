extends AnimatedSprite2D


func _ready():
	print("spawn")
	play("default")


func animation_finished():
	print("freed")
	queue_free()
