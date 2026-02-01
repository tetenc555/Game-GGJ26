extends CharacterBody3D

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
	


func animation():
	pass
