extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	##Set the version of the Arcade helper to be visible on the arcade!
	var version_text = str("Godot Arcade Helper Ver:  ", ProjectSettings.get_setting("application/config/version"))
	$Label.text = version_text
