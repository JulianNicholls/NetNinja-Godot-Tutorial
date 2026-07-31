extends Area2D

signal collision

var speed: int;
var rot: float
var dirX: float

var can_collide := true

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
		
# Collision with ship
func _on_body_entered(_body: Node2D) -> void:
	if can_collide:
		collision.emit()

func _on_laser_entered(area: Area2D) -> void:
	area.queue_free()	# Destroy current laser

	# We need to wait for the explosion to play for a bit before we delete ourzselves
	$DestroySound.play()
	$MeteorImage.hide()	
	can_collide = false
	await get_tree().create_timer(0.75).timeout
	
	Global.score += 5
	queue_free()		# Destroy this meteor
