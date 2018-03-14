# Couple-quest <img src="hra.png" align="right">
>### [Latest release](../../releases/latest)

Simple "board-like" game for couples.

Rewrited in GDScript, using [Godot Engine v2.1](https://godotengine.org/) 


### Contribute
#### Add own modul with tasks.
Tasks are stored in [/data](/data) in script as lists.
In script are tasks sorted in 8 separate list, 4 for each gender.
Game have three phases I > R > V. (_IOn_, _ROn_, _VOn_ are tasks for him) (_IOna_, _ROna_, _VOna_ are tasks for her)
Player which first gain 15 points are rewarded with task from _Ona_ (for him) or _On_ (for her).

Task deck is selceted in game menu, curently we have czech and english tasks in [basic](/data/basic.gd) and [alternative](/data/alternative.gd) (both wait's to translation vica versa)

#### see [issues](../../issues)
#### translate PO files 
Tranaslations are stored in *file*.*languecode*.po like [`Menu.en.po`](/Menu.en.po) (and templates as [`alternative.pot`](/data/alternative.pot))
### In game screenshots
<img src="/screen_menu.png">
<img src="/screen_options.png">
<img src="/screen_game.png">
<img src="/screen_end.png">

## GPL-3.0

    Card game for couple's foreplay.
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
