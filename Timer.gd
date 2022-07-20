extends Timer

"""const ENEMY := preload("res://gura.tscn")
const ENEMY_SPEED := 300

enum SPAWN_LOCATION{
	UP,
	DOWN,
}

func _ready():
	randomize()
	spawn_enemy()
	
	

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
	wait_time = rand_range(0.5, 2)
	self.start()

func _on_Timer_timeout():
	spawn_enemy()"""
