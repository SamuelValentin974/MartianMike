extends CanvasLayer

@onready var _winScreen = $WinScreen

func ShowWinScreen(flag: bool):
	_winScreen.visible = flag
	
