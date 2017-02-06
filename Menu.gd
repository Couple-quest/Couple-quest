extends Panel
var data
var konec = 16
var lang = "cs"

func options():
	get_node("set/Možnosti").popup()

func start():
	get_tree().change_scene("res://hra.tscn")

func _ready():
	get_node("start").connect("pressed",self,"start")
	get_node("set").connect("pressed",self,"options")
	get_node("set/Možnosti/delka/HScrollBar").connect("value_changed",self,"hChange")
	get_node("set/Možnosti/jazyk/OptionButton").connect("item_selected",self,"jazyk")
	get_node("set/Možnosti/jazyk/OptionButton").select(global.langid)
	get_node("set/Možnosti/balicek/OptionButton").connect("item_selected",self,"balik")
	
func hChange(konec):
	get_node("set/Možnosti/delka/HScrollBar/curLen").set_text(str(konec))
	get_node("/root/global").fin = konec
	
func jazyk(lang):
	var sel = get_node("set/Možnosti/jazyk/OptionButton").get_item_text(lang)
	get_node("/root/global").jazyk = sel
	get_node("/root/global").langid = lang
	TranslationServer.set_locale(sel)
	get_tree().reload_current_scene()
	
func balik(data):
	var sel = get_node("set/Možnosti/balicek/OptionButton").get_item_text(data)
	get_node("/root/global").balik = sel
