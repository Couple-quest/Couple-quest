#    Card game fo couple's foreplay.
#    Copyright (C) 2017  Couple-quest
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program. If not, see <http://www.gnu.org/licenses/>.
    
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
var cil = global.fin
var path = alternative
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

func ok(): ##button #tlaÄÃ­tko "SplnÄ›no"
	bod()
	kolo()

func jefaze(): #set phase of game to "faze" #vybÃ¡rÃ¡ fÃ¡zy
	minulafaze=faze
	if (scoreOn > cil/3) or (scoreOna > cil/3):
		faze = "R"
	if (scoreOn > (cil/3)*2) or (scoreOna > (cil/3)*2):
		faze = "V"
	if (scoreOn < cil/3) or (scoreOna < cil/3):
		faze = "I"
	print(faze)

func balicek(): #set card deck ## zjistÃ­ dostupnÃ© karty a obnovÃ­ balÃ­Äek pÅ™i zmÄ›nÄ› fÃ¡zÃ­
	if not(faze==minulafaze): ##new phase = new deck
		je=path.get(faze + "Ona")
		vyberOna=range(1, (je.size()))
		je=path.get(faze + "On")
		vyberOn=range(1, (je.size()))
		print("novü†¼²„Ã½ balÃ­Äek oba")
	elif vyberOna.size()==0: #empty deck Ona
		je=path.get(faze + "Ona")
		vyberOna=range(1, (je.size()))
		print("novÃ½ balÃ­Äek ona")
	elif vyberOn.size()==0: #empty deck On
		je = path.get(faze + "On")
		vyberOn=range(1, (je.size()))
		print("novÃ½ balÃ­Äek On")

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

func bod(): #add score ##poÄÃ­tÃ¡nÃ­ bodÅ¯
	if hraje == "Ona":
		scoreOna+=1
	else:
		scoreOn+=1

func end(): ##check end conditions
	if scoreOn > cil or scoreOna > cil:
		if end == "ne":
			print("end")
			get_node("popend").popup()
			var odmena =path.get(hraje)
			karta = (randi() % odmena.size())
			get_node("popend/odmena").set_text(str(odmena[karta]))
			end = "ano"

func quit(): #quit game and open menu
	get_tree().change_scene("res://Menu.tscn")
	
func no(): #back to game
	get_node("Quit?").hide()

func restart():
	get_node("Quit?").popup()
	get_node("Quit?/Ano").connect("pressed",self,"quit")
	get_node("Quit?/ne").connect("pressed",self,"no")

func _ready():
	if global.balik == "basic":
		path = basic
	if global.balik == "alternative":
		path = alternative
	balicek()
	get_node("fant").connect("pressed",self,"kolo")
	get_node("ok").connect("pressed",self,"ok")
	get_node("Restart").connect("pressed",self,"restart")
	randomize()
	var choose = randi() % 2
	if choose == 1:
		hraje = "On"
	else:
		hraje = "Ona"
	pass