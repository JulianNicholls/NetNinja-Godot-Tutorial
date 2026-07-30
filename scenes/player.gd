extends CharacterBody2D

@export var speed: int = 300

signal laser(position: Vector2)

var laserReady: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#position = Vector2(100, 500)
	pass

func _on_laser_timer_ready() -> void:
	laserReady = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:	
	var direction := Input.get_vector('left', 'right', 'up', 'down')
	velocity = direction * speed
	move_and_slide()

	# Shoot input
	if laserReady and Input.is_action_just_pressed('shoot'):
		laserReady = false
		$LaserTimer.start(0.2)
		laser.emit($LaserStartPos.global_position)
		$LaserSound.play()
		
func play_collision_sound() -> void:
	$CollisionSound.play()
