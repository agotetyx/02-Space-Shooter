extends KinematicBody2D

export var velocity = Vector2(0,-8)
onready var Explosion = load("res://Explosion/Explosion.tscn")
onready var player_effect = get_node("/root/Game/player_effect")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	position += velocity 
	#if position> get_viewport_rect().size+30.0:
		#queue_free
	
	
	if global_position.y < -100:
		queue_free()


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		
		#body.queue_free()
		var explosion = Explosion.instance()
		explosion.position = position
		get_node("/root/Game/Explosions").add_child(explosion)
		queue_free()
		get_tree().change_scene("res://Menu/Die.tscn")
	


	pass # Replace with function body.
