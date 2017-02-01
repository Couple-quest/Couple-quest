extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func start():
	get_tree().change_scene("res://hra.tscn")
func _ready():
	get_node("start").connect("pressed",self,"start")
	# Called every time the node is added to the scene.
	# Initialization here
	pass
