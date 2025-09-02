extends Node

var is_on_arcade : bool = false
var arcade_URL : String

func _ready() -> void:
	
	#Get the URL for the arcade
	arcade_URL = JavaScriptBridge.eval("window.location.href")
	
	#Connect HTTP Signal
	$HTTPRequest.request_completed.connect(_on_http_request_request_completed)
	#Request the page info
	$HTTPRequest.request(arcade_URL)

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	
	#Fetch JSON data
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	#Only check if the json file has the arcade key
	#(Assuming there is no other tag)
	if(json.has("arcade")):
		is_on_arcade = true
	else:
		is_on_arcade = false
	
	
	#Set Debug Label
	$DEBUG_DISPLAY/Label.text = str("is_on_arcade = ", is_on_arcade)
