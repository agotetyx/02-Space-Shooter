extends KinematicBody2D

export var move_speed = 3
export var limit = 400
onready var Explosion = load("res://Explosion/Explosion.tscn")

func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	var target = get_node("/root/Game/Player").position
	var velocity = Vector2(target.x-position.x, target.y-position.y)
	if velocity.length()>limit:
		if velocity.length()>move_speed:
			position += velocity.normalized() * move_speed
		else:
			position += velocity


func _on_Area2D_body_entered(body):
	body.queue_free()
	var explosion = Explosion.instance()
	explosion.position = position
	get_node("/root/Game/Explosions").add_child(explosion)
	queue_free()
	get_tree().change_scene("res://Menu/Die.tscn")
