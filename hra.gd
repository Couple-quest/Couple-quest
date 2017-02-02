extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var je
var hraje = "On"
var faze = "I"
var karta = 2
var tah
var scoreOn = 0
var scoreOna = 0
var vyberOn = []
var vyberOna = []
var minulafaze = "start"
var path = "cs"
var ukol = ""
var end = "ne"


func kolo(): #old_ok
	jefaze()
	balicek()
	tik() #old_kolo
	end()
	get_node("hraje").set_text(hraje)
	get_node("on").set_text(str(scoreOn))
	get_node("ona").set_text(str(scoreOna))

func ok():
	bod()
	kolo()

func jefaze(): #set phase of game to "faze"
	minulafaze=faze
	if (scoreOn > 6) or (scoreOna > 6):
		faze = "R"
	if (scoreOn > 10) or (scoreOna > 10):
		faze = "V"
	if (scoreOn < 6) or (scoreOna < 6):
		faze = "I"
	print(faze)

func balicek(): # zjistí dostupné karty a obnoví balíček při změně fází
	if not(faze==minulafaze):
		je=cs.get(faze + "Ona")
		vyberOna=range(1, (je.size()))
		je=cs.get(faze + "On")
		vyberOn=range(1, (je.size()))
		print("nov������ý balíček oba")
	elif vyberOna.size()==0:
		je=cs.get(faze + "Ona")
		vyberOna=range(1, (je.size()))
		print("nový balíček ona")
	elif vyberOn.size()==0:
		cs.get(faze + "On")
		vyberOn=range(1, (je.size()))
		print("nový balíček On")

func tik(): #old_kolo
	if hraje == "On":
		karta = (randi() % vyberOn.size())
		vyberOn.remove(karta)
		ukol = cs.get(faze + hraje)[karta]
		hraje = "Ona"
	else:
		karta = (randi() % vyberOna.size())
		vyberOna.remove(karta)
		ukol = cs.get(faze + hraje)[karta]
		hraje = "On"
	get_node("screen/ukol").set_text(str(ukol))
	print("tak")
	
func bod():
	if hraje == "Ona":
		scoreOna+=1
	else:
		scoreOn+=1

func end():
	if scoreOn | scoreOna > 16:
		if end == "ne":
			print("end")
			get_node("popend").popup()
			var odmena =cs.get(hraje)
			karta = (randi() % odmena.size())
			get_node("popend/odmena").set_text(str(odmena[karta]))
			end = "ano"

func _ready():
	balicek()
	get_node("fant").connect("pressed",self,"kolo")
	get_node("ok").connect("pressed",self,"ok")
	# Called every time the node is added to the scene.
	# Initialization here
	pass

