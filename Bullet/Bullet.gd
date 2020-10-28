extends KinematicBody2D

export var velocity = Vector2(0,-8)
onready var rocket_effect = get_node("/root/Game/rocket_effect")
onready var rock_effect = get_node("/root/Game/rock_effect")
onready var Explosion = load("res://Explosion/Explosion.tscn")
onready var HUD = get_node("/root/Game/HUD")
export var points = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	position += velocity
	
	
	if global_position.y < -100:
		queue_free()

func play_sound(sound):
		sound.play()


func _on_Area2D_body_entered(body):
	body.queue_free()
	HUD.update_score(points)
	var explosion = Explosion.instance()
	explosion.position = position
	get_node("/root/Game/Explosions").add_child(explosion)
	if body.name == "Enemy":
		play_sound(rocket_effect)
	if body.name == "Asteroid" or "Rocks":
		play_sound(rock_effect)
	#if body.name == "Enemy":
	
		
	queue_free()
	
