extends Node2D

@export var speed: int = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#position = Vector2(100, 500)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#position += Vector2(1, -1) * 40.0 * delta
	#$PlayerShipImage.rotation += 0.3 * delta
	#print(delta)
	
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	position += direction * speed * delta

#func _input(event: InputEvent) -> void:
	#if event is InputEventKey and event.is_pressed():
		#var key = event.physical_keycode 
		#if key == KEY_W:
			#position += Vector2(0, -5)
		#
		#if key == KEY_S:
			#position += Vector2(0, 5)
		#
		#if key == KEY_A:
			#position += Vector2(-5, 0)
		#
		#if key == KEY_D:
			#position += Vector2(5, 0)
