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
var konec = 16
var lang = "cs"

func _ready():
	get_node("set/Možnosti/jazyk/OptionButtonL").select(global.langid)
	get_node("set/Možnosti/balicek/OptionButton").select(global.balik)
	pass

func _on_LinkButton_pressed():
	OS.shell_open("https://github.com/Couple-quest/Couple-quest")

func _on_start_pressed():
	get_tree().change_scene("res://hra.tscn")

func _on_set_pressed():
	get_node("set/Možnosti").popup()

func _on_exit_pressed():
	get_tree().quit()

func _on_HScrollBar_value_changed(value):
	get_node("set/Možnosti/delka/HScrollBar/curLen").set_text(str(value))
	get_node("/root/global").fin = value

func _on_OptionButton_item_selected(ID):
	get_node("/root/global").balik = ID

func _on_OptionButtonL_item_selected(ID):
	var sel = get_node("set/Možnosti/jazyk/OptionButtonL").get_item_text(ID)
	get_node("/root/global").jazyk = ID
	get_node("/root/global").langid = ID
	print(ID," ID")
	print(sel," sel")
	print(global.langid," global.langid")
	print(global.jazyk," global.jazyk")
	print(TranslationServer.get_locale())
	TranslationServer.set_locale(sel)
	print(TranslationServer.get_locale())
	