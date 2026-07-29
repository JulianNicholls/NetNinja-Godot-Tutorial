extends Area2D

var speed: int;
var rot: float
var dirX: float

func _ready() -> void:
	var rng := RandomNumberGenerator.new()		

	var num := rng.randi_range(1, 4)
	var path: String = "res://assets/PNG/Meteors/meteorBrown_big" + str(num) + ".png"
	$MeteorImage.texture = load(path)
	
	var width := get_viewport_rect().size[0]
	var randomX := rng.randf_range(0, width)
	var randomY := rng.randf_range(-150, -50);

	speed = rng.randi_range(200, 500)
	dirX = rng.randi_range(-1, 1)
	rot = rng.randf_range(-2, 2)
	
	position = Vector2(randomX, randomY)
	 
func _process(delta: float) -> void:
	position += Vector2(dirX, 1.0) * speed * delta
	rotation += rot * delta
		
func _on_body_entered(body: Node2D) -> void:
	print('Bang!') # Replace with function body.
	print(body)
