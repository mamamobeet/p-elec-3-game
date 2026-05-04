extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		# start the flickering effect on the player
		body.modulate = Color(10, 0, 0) 
		if body.has_method("start_fire_flicker"):
			body.start_fire_flicker()

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		# stop the flickering and reset color
		if body.has_method("stop_fire_flicker"):
			body.stop_fire_flicker()
		body.modulate = Color(1, 1, 1) 
