extends CanvasLayer

func _ready() -> void:	
	$VBoxContainer/ScoreText.text = 'Your Score: ' + str(Global.score)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed('restart'):
		get_tree().change_scene_to_file('res://scenes/level.tscn')
