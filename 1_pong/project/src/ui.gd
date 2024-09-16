class_name UI extends Control

@onready var main_menu  : Control = self.get_node('Main Menu')
@onready var pause_menu : Control = self.get_node("Pause Menu")

@onready var btn_start : Label = self.s

const unhovered = Color(0.2, 0.2, 0.2, 1.0)
const hovered   = Color(0.8, 0.8, 0.8, 1.0)
const selected  = Color(1.0, 1.0, 1.0, 1.0)

func main_show() -> void:
	main_menu.show()
	
	return

func main_hide() -> void:
	main_menu.hide()
	return
	
func pause_show() -> void:
	pause_menu.show()
	
	return
	
func pause_hide() -> void:
	pause_menu.hide()
	return

#region Control

#endregion

#region Node

#endregion

#region Object

#endregion
