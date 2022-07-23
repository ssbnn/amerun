extends ParallaxLayer

export(float) var FLOOR_SPEED = -300

func _process(delta) -> void:
	self.motion_offset.x += FLOOR_SPEED * delta
