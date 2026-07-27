extends CharacterBody2D

@export var speed: int = 300

signal laser(position: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#position = Vector2(100, 500)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	velocity = direction * speed
	move_and_slide()

	# Shoot input
	if Input.is_action_just_pressed('shoot'):
		laser.emit($LaserStartPos.global_position)
