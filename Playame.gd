extends KinematicBody2D

signal hit

export var gravity = 1000
export var speed = 10.0
export var rot_speed = 4.0
export var jump_speed = 500.0

onready var screen_size = get_viewport_rect()
onready var sound_jump = $Jump
onready var sound_die = $Die

var velocity = Vector2.ZERO

enum STATUS{
	ROLLING, JUMP, IN_AIR, SLIDE
}

var status

func _ready():
	status = STATUS.ROLLING

func start(pos):
	show()
	position = pos 
	$CollisionShape2D.disabled = false


func get_input(delta):
	if Input.is_action_pressed("slide"):
		status = STATUS.SLIDE
	
	if Input.is_action_just_released("slide"):
		status = STATUS.ROLLING
		
	if Input.is_action_just_pressed("jump"):
		
		if is_on_floor():
			status = STATUS.JUMP
			sound_jump.play()
			
func _process(delta):
	get_input(delta)
	
	match(status):
		STATUS.ROLLING:
			$AnimatedSprite.play("rolling ame")
			$AnimatedSprite.scale = Vector2.ONE * 0.5
			
		STATUS.JUMP:
			if is_on_floor():
				velocity += Vector2.UP * delta * 30000
				status = STATUS.IN_AIR
				
		STATUS.IN_AIR:
			if is_on_floor():
				status = STATUS.ROLLING
			
			else:
				$AnimatedSprite.scale = Vector2.ONE * 0.25
				$AnimatedSprite.play("jumping ame")
		
		STATUS.SLIDE:
			if not is_on_floor():
				velocity += Vector2.DOWN * delta * 10000
			
			$AnimatedSprite.scale = Vector2.ONE * 0.2
			$AnimatedSprite.play("sliding ame")
	

func _physics_process(delta):
	velocity += gravity * delta * Vector2.DOWN
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func _on_Area2D_body_entered(body):
	if body.get_name() != 'Player':
		emit_signal("hit")
		$CollisionShape2D.set_deferred("disabled", true)
		hide()
		print('asdf')
		#sound_die.play()
		
