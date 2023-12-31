extends CharacterBody2D

@export var SHELL: PackedScene
const MUZZLE_DISTANCE = 80


func _input(event):
	if event is InputEventMouseMotion:
		var angle = position.direction_to(event.position).angle() + 1.5708
		$BarrelSprite.rotation = snapped(angle, PI/4) 
		#$BarrelSprite.rotate(1.5708) # 90 deg offset
	
	if event.is_action_pressed("Fire"):
		var shot_shell = SHELL.instantiate() as CharacterBody2D
		shot_shell.rotation = $BarrelSprite.rotation
		shot_shell.position = position + Vector2.UP.rotated($BarrelSprite.rotation) * MUZZLE_DISTANCE
		self.add_sibling(shot_shell)
