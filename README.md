# Couple-quest <img src="https://github.com/Clonewayx/Couple-quest/blob/master/slice/hra.png" align="right">
Simple "board-like" game for couples.

Now variables and interface is in Czech, but task are imported from [/slice](/slice) (in any language).
Script is curentli worknig with task on images (wich I had before but don't have licence right to them) and in text file with lists importet like python module.
TKinter is used for GUI

### Launch game
##### Linux
In main folder (Couple-quest) run `python hra.py`
Script import modules: random, Tkinter and [PIL](https://pypi.python.org/pypi/Pillow/1.7.8)
##### Windows
In [/build/win](/build/win) execute hra.exe

### Contribute
##### Add own modul with tasks.
Tasks are stored in [/slice](/slice) in python modules as [lists](https://docs.python.org/2/tutorial/introduction.html#lists).
In module are tasks sorted in 8 separate list, 4 for each gender
Game have three phases I > R > V. (_IOn_, _ROn_, _VOn_ are tasks for him) (_IOna_, _ROna_, _VOna_ are tasks for her)
Player which first gain 15 points are rewarded with task from _Ona_ (reward for him) or _On_ (for her).

Task modul is selected by varibale`data` in script. (curently have czech and english tasks in [cs](/slice/cs.py) and [en](/slice/en.py) + experimental blank images in [img/](/slice/img))
