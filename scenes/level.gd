extends Node2D

# 1. Load the scenes
var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

func _on_meteor_timer_timeout() -> void:
	# 2. Create an instance
	var meteor	= meteor_scene.instantiate()
	
	meteor.position = Vector2(100, 100)
	
	# 3. Attach the scene to the tree
	$Meteors.add_child(meteor)

func _on_player_laser(position: Vector2) -> void:
	# 2. Create an instance
	var laser = laser_scene.instantiate()

	# 3. Attach the scene to the tree
	$Lasers.add_child(laser)
	laser.position = position
