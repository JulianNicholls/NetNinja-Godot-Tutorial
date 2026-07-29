extends CanvasLayer

static var life_filename := 'res://assets/PNG/UI/playerLife1_red.png'

func set_health(amount: int) -> void:
	print('set_health: ', amount)
	
	# remove previous ships from LifeContainer
	for child in $MarginContainer2/LifeContainer.get_children():
		child.queue_free()
		
	# Put back the health amount
	for i in amount:
		var texture_rect = TextureRect.new()
		texture_rect.texture = load(life_filename)
		texture_rect.stretch_mode = TextureRect.STRETCH_KEEP
		$MarginContainer2/LifeContainer.add_child(texture_rect)
 
