extends RigidBody2D

func _ready():
	var animations = $AnimatedSprite.frames.get_animation_names()
	
	$AnimatedSprite.play(animations[randi() % len(animations)])


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
