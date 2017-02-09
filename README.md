# Couple-quest <img src="/slice/hra.png" align="right">
Simple "board-like" game for couples.

Rewrited to GDScript [here](../../tree/Godot-rewrite)

Now variables and interface is in Czech, but task are imported from [/slice](/slice) (in any language).
Script is curentli worknig with task on images (wich I had before but don't have licence right to them) and in text file with lists importet like python module.
TKinter is used for GUI

### Launch game
##### Linux
Depends on *python-tk* and *python-pil*

In main folder (Couple-quest) run `hra.py`
###### Script import modules: random, Tkinter and [PIL](https://pypi.python.org/pypi/Pillow/1.7.8)
##### Windows
In [/build/win](/build/win) execute hra.exe

### Contribute
Port/Build for IPhone  and Android.
##### Add own modul with tasks.
Tasks are stored in [/slice](/slice) in python modules as [lists](https://docs.python.org/2/tutorial/introduction.html#lists).
In module are tasks sorted in 8 separate list, 4 for each gender
Game have three phases I > R > V. (_IOn_, _ROn_, _VOn_ are tasks for him) (_IOna_, _ROna_, _VOna_ are tasks for her)
Player which first gain 15 points are rewarded with task from _Ona_ (reward for him) or _On_ (for her).

Task modul is selected by varibale`data` in script. (curently have czech and english tasks in [cs](/slice/cs.py) and [en](/slice/en.py) + experimental blank images in [img/](/slice/img))

##### see [issues](../../issues)


# GPL-3.0


    Card game fo couple's foreplay.
    Copyright (C) 2017  Couple-quest

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program. If not, see <http://www.gnu.org/licenses/>.
