extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#position = Vector2(100, 500)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2(1, -1) * 40.0 * delta
	$PlayerShipImage.rotation += 0.3 * delta
