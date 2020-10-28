extends Control

onready var global = get_node("/root/Global")

func _ready():
	update_score(0)
	


func update_score(s):
	global.score += s
	$Score.text = "Score: " + str(global.score)
	if global.score >= 30:
		get_tree().change_scene("res://Menu/Win.tscn")

