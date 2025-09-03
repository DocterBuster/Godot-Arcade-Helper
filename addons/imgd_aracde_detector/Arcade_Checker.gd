extends Node

var is_on_arcade : bool = false
var game_url : String = "NOT ON WEB"

func _ready() -> void:
	
	#Get the URL for the arcade
	if(OS.has_feature("web")):
		print("Arcade Checker: Web Build Detected!")
		
		#Fetch the game URL information 
		var doc = JavaScriptBridge.get_interface("document")
		if(doc):
			game_url = doc.location.href
			#If the URL ends with ?arcade, it is on the arcade! 
			is_on_arcade = game_url.ends_with("?arcade")
	
	#Set Debug Label
	$DEBUG_DISPLAY/Label.text = str("is_on_arcade = ", is_on_arcade)
