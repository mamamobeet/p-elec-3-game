extends Node2D

const SPEED := 300.0
var direction := Vector2.RIGHT

func _process(delta):
	position += direction * SPEED * delta
	rotation = direction.angle()
