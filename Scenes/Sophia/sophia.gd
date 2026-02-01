extends CharacterBody3D
@onready var sprite: AnimatedSprite3D = $AnimatedSprite3D

var last_direction = "frente"
var input_locked:= false
const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _ready() -> void:
	add_to_group("player")

func _physics_process(delta: float) -> void:
	
	if input_locked:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	if input_dir.x == 0 and input_dir.y == 0:
		if(last_direction == "frente"):
			sprite.play("idle_frente")
		elif(last_direction == "esquerda"):
			sprite.play("idle_lado")
			sprite.flip_h = true;
		elif(last_direction == "direita"):
			sprite.play("idle_lado")
			sprite.flip_h = false;
		elif(last_direction == "costas"):
			sprite.play("idle_costas")
	else:
		if input_dir.x > 0:
			last_direction = "direita"
			sprite.play("andar_lado")
			sprite.flip_h = false;
		elif input_dir.x < 0:
			last_direction = "esquerda"
			sprite.play("andar_lado")
			sprite.flip_h = true;
		elif input_dir.y < 0:
			last_direction = "costas"
			sprite.play("andar_costas")
		elif input_dir.y > 0:
			last_direction = "frente"
			sprite.play("andar_frente")	
		
