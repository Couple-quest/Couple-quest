extends Panel
var data = "cs"
var konec = 16

func options():
	get_node("set/Možnosti").popup()

func start():
	get_tree().change_scene("res://hra.tscn")

func _ready():
	get_node("start").connect("pressed",self,"start")
	get_node("set").connect("pressed",self,"options")
	get_node("set/Možnosti/HScrollBar").connect("value_changed",self,"hChange")
	
func hChange(konec):
	get_node("set/Možnosti/HScrollBar/curLen").set_text(str(konec))
