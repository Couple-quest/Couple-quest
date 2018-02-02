#    Card game for couple's foreplay.
#    Copyright (C) 2017-2018  Couple-quest
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
var data
var konec = 16
var lang = "cs"

func options():
	get_node("set/Možnosti").popup()

func quit():
	get_tree().quit()

func start():
	get_tree().change_scene("res://hra.tscn")

func _ready():
	get_node("start").connect("pressed",self,"start")
	get_node("set").connect("pressed",self,"options")
	get_node("set/Možnosti/delka/HScrollBar").connect("value_changed",self,"hChange")
	get_node("set/Možnosti/jazyk/OptionButton").connect("item_selected",self,"jazyk")
	get_node("set/Možnosti/jazyk/OptionButton").select(global.langid)
	get_node("set/Možnosti/balicek/OptionButton").connect("item_selected",self,"balik")
	get_node("exit").connect("pressed",self,"quit")
	
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


func _on_LinkButton_pressed():
	OS.shell_open("https://github.com/Couple-quest/Couple-quest")
	pass
