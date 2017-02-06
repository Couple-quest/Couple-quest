extends Panel

var chosse = randi() % 2
var hraje
var faze = "I"
var karta
var scoreOn = 0
var scoreOna = 0
var vyberOn
var vyberOna
var minulafaze = "start"
var path = en #choose deck
var ukol
var end = "ne"
var je

func kolo(): #old_ok
	get_node("hraje").set_text(hraje)
	jefaze()
	balicek()
	tik() #old_kolo
	end()
	get_node("on").set_text(str(scoreOn))
	get_node("ona").set_text(str(scoreOna))

func ok(): ##button #tlačítko "Splněno"
	bod()
	kolo()

func jefaze(): #set phase of game to "faze" #vybárá fázy
	minulafaze=faze
	if (scoreOn > 6) or (scoreOna > 6):
		faze = "R"
	if (scoreOn > 10) or (scoreOna > 10):
		faze = "V"
	if (scoreOn < 6) or (scoreOna < 6):
		faze = "I"
	print(faze)

func balicek(): #set card deck ## zjistí dostupné karty a obnoví balíček při změně fází
	if not(faze==minulafaze): ##new phase = new deck
		je=path.get(faze + "Ona")
		vyberOna=range(1, (je.size()))
		je=path.get(faze + "On")
		vyberOn=range(1, (je.size()))
		print("nov������ý balíček oba")
	elif vyberOna.size()==0: #empty deck Ona
		je=path.get(faze + "Ona")
		vyberOna=range(1, (je.size()))
		print("nový balíček ona")
	elif vyberOn.size()==0: #empty deck On
		je = path.get(faze + "On")
		vyberOn=range(1, (je.size()))
		print("nový balíček On")

func tik(): #old_kolo ## roound cycle ##konec tahu
	if hraje == "On":
		karta = (randi() % vyberOn.size())
		vyberOn.remove(karta)
		ukol = path.get(faze + hraje)[karta]
		hraje = "Ona"
	else:
		karta = (randi() % vyberOna.size())
		vyberOna.remove(karta)
		ukol = path.get(faze + hraje)[karta]
		hraje = "On"
	get_node("screen/ukol").set_text(str(ukol))
	randomize() #randomseed
	print("tak")

func bod(): #add score ##počítání bodů
	if hraje == "Ona":
		scoreOna+=1
	else:
		scoreOn+=1

func end(): ##check end conditions
	if scoreOn | scoreOna > 16:
		if end == "ne":
			print("end")
			get_node("popend").popup()
			var odmena =path.get(hraje)
			karta = (randi() % odmena.size())
			get_node("popend/odmena").set_text(str(odmena[karta]))
			end = "ano"

func _ready():
	balicek()
	get_node("fant").connect("pressed",self,"kolo")
	get_node("ok").connect("pressed",self,"ok")
	randomize()
	var choose = randi() % 2
	if choose == 1:
		hraje = "On"
	else:
		hraje = "Ona"
	pass