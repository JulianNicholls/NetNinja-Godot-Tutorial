extends Node2D

# 1. Load the meteor scene
var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")

func _on_meteor_timer_timeout() -> void:
	# 2. Create an instance
	var meteor	= meteor_scene.instantiate()
	
	meteor.position = Vector2(100, 100)
	
	# 3. Attach the scene to the tree
	$Meteors.add_child(meteor)
