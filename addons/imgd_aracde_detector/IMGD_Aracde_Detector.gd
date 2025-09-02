@tool
extends EditorPlugin


func _enable_plugin():
	# The autoload can be a scene or script file.
	add_autoload_singleton("Arcade_Checker", "res://addons/imgd_aracde_detector/Arcade_Checker.tscn")


func _disable_plugin():
	remove_autoload_singleton("Arcade_Checker")
