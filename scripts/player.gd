extends CharacterBody2D

const SPEED = 300.0
const ROTATION_SPEED = 10.0
var is_on_fire = false

@onready var anim = $Sprite2D
@onready var gun = $Sprite2D/Gun

func _physics_process(delta: float) -> void:
	# Movement
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		var target_angle = direction.angle()
		anim.rotation = lerp_angle(anim.rotation, target_angle, ROTATION_SPEED * delta)
	else:
		velocity = lerp(velocity, Vector2.ZERO, 0.3)
	move_and_slide()

	# Animation
	if Input.is_action_pressed("shoot"):
		anim.play("shoot")
		gun.visible = true
	else:
		anim.play("default")
		gun.visible = false

func die():
	set_physics_process(false)
	hide()
	print("Player died! Restarting in 1 second...")
	await get_tree().create_timer(1.0).timeout
<<<<<<< HEAD
	get_tree().reload_current_scene()

func start_fire_flicker():
	is_on_fire = true
	while is_on_fire:
		self.modulate = Color(10, 0.2, 0.2)
		await get_tree().create_timer(0.1).timeout
		self.modulate = Color(1, 1, 1)
=======
	get_tree().reload_current_scene() # Restarts the level


# for fire areanode
func start_fire_flicker():
	is_on_fire = true
	while is_on_fire:
		self.modulate = Color(10, 0.2, 0.2) 
		await get_tree().create_timer(0.1).timeout
		self.modulate = Color(1, 1, 1) 
<<<<<<< Updated upstream
=======
>>>>>>> 2fbafe7cfb34a52a1f272fea3aac7238a5956f7d
>>>>>>> Stashed changes
		await get_tree().create_timer(0.1).timeout

func stop_fire_flicker():
	is_on_fire = false

<<<<<<< Updated upstream

func _on_fire_detector_body_entered(body: Node2D) -> void:
	# This checks if the thing we stepped on is named 'obstacle'
=======
<<<<<<< HEAD
func _on_fire_detector_body_entered(body: Node2D) -> void:
=======

func _on_fire_detector_body_entered(body: Node2D) -> void:
	# This checks if the thing we stepped on is named 'obstacle'
>>>>>>> 2fbafe7cfb34a52a1f272fea3aac7238a5956f7d
>>>>>>> Stashed changes
	if body.name == "obstacle":
		start_fire_flicker()

func _on_fire_detector_body_exited(body: Node2D) -> void:
	if body.name == "obstacle":
		stop_fire_flicker()
