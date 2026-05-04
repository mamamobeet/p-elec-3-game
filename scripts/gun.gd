extends Node2D

const BULLET = preload("res://scenes/bullet.tscn")

@onready var muzzle: Marker2D = $Marker2D

func _process(delta):
	look_at(get_global_mouse_position())

	if Input.is_action_just_pressed("shoot"):
		var bullet_instance = BULLET.instantiate()
		get_tree().current_scene.add_child(bullet_instance)

		bullet_instance.global_position = muzzle.global_position
		bullet_instance.direction = global_transform.x
