extends KinematicBody2D


onready var Bullet = load("res://EnemyBullet/EnemyBullet.tscn")
export var move_speed = 3
export var limit = 400


func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	var target = get_node("/root/Game/Player").position
	look_at(target)
	rotation_degrees += 90
	var velocity = Vector2(target.x-position.x, target.y-position.y)
	if velocity.length()>move_speed:
		position += velocity.normalized() * move_speed
	else:
		position += velocity


func _on_Timer_timeout():
	var bullet = Bullet.instance()
	bullet.position = position
	bullet.rotation = rotation
	bullet.velocity = bullet.velocity.rotated(rotation)
	get_node("/root/Game/EnemyBullet container").add_child(bullet)
	$Timer.start()
