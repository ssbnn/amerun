extends ParallaxLayer

export(float) var BG_SPEED = -15

func _process(delta) -> void:
	self.motion_offset.x += BG_SPEED * delta

