extends Control

onready var global = get_node("/root/Global")

func _ready():
	update_score(0)
	


func update_score(s):
	global.score += s
	$Score.text = "Score: " + str(global.score)
	if global.score >= 100 and global.level != 2:
		get_node("/root/Game/Level").show()
		get_node("/root/Game/Level").monitoring = true

