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
