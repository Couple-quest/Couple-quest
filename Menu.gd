extends Panel
var data = cs
var konec = 16
var lang = "en"

func options():
	get_node("set/Možnosti").popup()

func start():
	get_tree().change_scene("res://hra.tscn")

func _ready():
	get_node("start").connect("pressed",self,"start")
	get_node("set").connect("pressed",self,"options")
	get_node("set/Možnosti/delka/HScrollBar").connect("value_changed",self,"hChange")
	get_node("set/Možnosti/jazyk/OptionButton").connect("item_selected",self,"jazyk")
	get_node("set/Možnosti/balicek/OptionButton").connect("item_selected",self,"balik")
	
func hChange(konec):
	get_node("set/Možnosti/delka/HScrollBar/curLen").set_text(str(konec))
	get_node("/root/global").fin = konec
	
func jazyk(lang):
	var sel = get_node("set/Možnosti/jazyk/OptionButton").get_item_text(lang)
	get_node("/root/global").jazyk = sel
	TranslationServer.set_locale(sel)
	print(sel)
	pass
	
func balik(data):
	var sel = get_node("set/Možnosti/balicek/OptionButton").get_item_text(data)
	get_node("/root/global").balik = sel
	pass
