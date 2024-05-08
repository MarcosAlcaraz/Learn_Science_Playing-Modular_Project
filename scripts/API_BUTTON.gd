extends Button


@onready var http_request = $HTTPRequest
const url = "http://localhost:3001"
var page := "/test"


func _on_pressed():
	http_request.request(url + page)

func _on_http_request_request_completed(result, response_code, headers, body):
	# Si necesito convertir el String a JSON
	#var data = JSON.parse_string(body.get_string_from_utf8())
	#print(data)
	
	# Imprimir Body
	print(body.get_string_from_utf8())
