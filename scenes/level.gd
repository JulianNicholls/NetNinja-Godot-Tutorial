extends Node2D

var health := 5

# 1. Load the scenes
var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

func _ready() -> void:
	var size := get_viewport_rect().size
	var rng := RandomNumberGenerator.new()
	
	for star in $Stars.get_children():
		# Set position
		var posX := rng.randf_range(0, size.x)
		var posY := rng.randf_range(0, size.y)
		star.position = Vector2(posX, posY)
		
		# Set scale
		var starScale := rng.randf_range(0.5, 1)
		star.scale = Vector2(starScale, starScale)
		
		 # Set speed
		star.speed_scale = rng.randf_range(0.6, 1.4)
		
	# Set up health etc
	get_tree().call_group('UI', 'set_health', health)

func _on_meteor_timer_timeout() -> void:
	# 2. Create an instance
	var meteor	:= meteor_scene.instantiate()
	
	meteor.position = Vector2(100, 100)
	
	# 3. Attach the scene to the tree
	$Meteors.add_child(meteor)
	
	# 4. Connect the signal
	meteor.connect('collision', _on_meteor_collision)
	
func _on_meteor_collision() -> void:
	health -= 1
	get_tree().call_group('UI', 'set_health', health)
	if health <= 0: 
		get_tree().change_scene_to_file('res://scenes/game_over.tscn')
	
func _on_player_laser(pos: Vector2) -> void:
	# 2. Create an instance
	var laser := laser_scene.instantiate()

	# 3. Attach the scene to the tree
	$Lasers.add_child(laser)
	laser.position = pos
