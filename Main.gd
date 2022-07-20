extends Node2D

const ENEMY := preload("res://gura.tscn")
const ENEMY_SPEED := 300
onready var screen := get_viewport_rect()
onready var bgm = $BGM

enum SPAWN_LOCATION{
	UP,
	DOWN,
}

var score = 0

var a = 0

func _ready():
	randomize()
	bgm.play()


func _on_HUD_start_game():
	get_tree().call_group("enemy", "queue_free")
	score = 0
	$Player.start($Position2D.position)
	$HUD.set_score(score)
	$HUD.show_message("Get Ready")
	$StartTimer.start()

func _on_Player_hit():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	a = 0
	
	
func spawn_enemy():
	var enemy = ENEMY.instance()

	var spawn_location := randi() % 2
	var enemy_position := Vector2.ZERO
	
	enemy_position.x = 1100
	match spawn_location:
		SPAWN_LOCATION.UP:
			enemy_position.y = 400
		SPAWN_LOCATION.DOWN:
			enemy_position.y = 480


	enemy.position = enemy_position
	enemy.linear_velocity = Vector2(-ENEMY_SPEED, 0)
	
	add_child(enemy)
	$MobTimer.wait_time = rand_range(0.5, 2)
	$MobTimer.start()

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	a+= 1
	print('starttimer',a)
	
func _on_ScoreTimer_timeout():
	score += 1 
	$HUD.set_score(score)
