extends CharacterBody2D

const SPEED := 300.0
var direction := Vector2.RIGHT

func _physics_process(delta):
	rotation = direction.angle()
	var collision = move_and_collide(direction * SPEED * delta)
	if collision:
		queue_free()  # destroy bullet on hit
