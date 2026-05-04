extends CharacterBody2D

const SPEED = 300.0

@onready var anim = $Sprite2D
@onready var gun = $Gun

func _physics_process(delta: float) -> void:
	# Movement
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if direction != Vector2.ZERO:
		velocity = direction * SPEED
	else:
		velocity = lerp(velocity, Vector2.ZERO, 0.3)

	move_and_slide()

	look_at(get_global_mouse_position())

	# Animation
	if Input.is_action_pressed("shoot"):
		anim.play("shoot")
		gun.visible = true
	else:
		anim.play("default")
		gun.visible = false

func die():
	# 1. Disable physics so the player doesn't keep moving/falling
	set_physics_process(false)
	# 2. Hide the player or play a death animation
	hide() 
	print("Player died! Restarting in 1 second...")
	# 3. Wait for 1.0 seconds
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene() # Restarts the level


# for fire areanode
func start_fire_flicker():
	is_on_fire = true
	while is_on_fire:
		self.modulate = Color(10, 0.2, 0.2) 
		await get_tree().create_timer(0.1).timeout
		self.modulate = Color(1, 1, 1) 
		await get_tree().create_timer(0.1).timeout

func stop_fire_flicker():
	is_on_fire = false


func _on_fire_detector_body_entered(body: Node2D) -> void:
	# This checks if the thing we stepped on is named 'obstacle'
	if body.name == "obstacle":
		start_fire_flicker()

func _on_fire_detector_body_exited(body: Node2D) -> void:
	if body.name == "obstacle":
		stop_fire_flicker()
