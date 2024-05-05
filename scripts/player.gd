extends CharacterBody2D

var http_request = HTTPRequest.new() # Crear una nueva instancia de HTTPRequest

# Called when the node enters the scene tree for the first time.
func _ready():
	$Animation_Player.play("walk_mode")
	self.add_child(http_request) # Añadirlo como un nodo hijo
	http_request.connect("request_completed", self, "_on_request_completed") # Conectar la señal "request_completed" a la función "_on_request_completed"
	var error = http_request.request("http://api.example.com/test") # Iniciar una solicitud GET
	if error == OK:
		print("Solicitud iniciada correctamente.")
	else:
		print("Error al iniciar la solicitud.")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * 2000
	move_and_slide()

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result["message"]) # Imprimir el mensaje de la respuesta

	
	#self.add_child(http_request) # Añadirlo como un nodo hijo
	#http_request.connect("request_completed", self, "_on_request_completed") # Conectar la señal "request_completed" a la función "_on_request_completed"var error = http_request.request("http://api.example.com/test") # Iniciar una solicitud GET
	#if error == OK:
		#print("Solicitud iniciada correctamente.")
	#else:
		#("Error al iniciar la solicitud.")
#
#func _on_request_completed(result, response_code, headers, body):
	#var json = JSON.parse(body.get_string_from_utf8())
	#(json.result["message"]) # Imprimir el mensaje de la respuesta

	#if self.position == Vector2(500, 0):
	#if Input.is_action_pressed("ui_up"):
		#var url = "https://4972-2806-2f0-55c0-e607-112-bc23-2beb-18c7.ngrok-free.app/test" # La URL de tu API
		#var headers = ["Content-Type: application/json"] # Los encabezados de la solicitud
		#var body = {
			#"game_token": "1",
			#"island_id": 45,
			#"new_ELO": 563
		#} # El cuerpo de la solicitud			
		#http_request.request(url, headers, HTTPClient.METHOD_GET)

#func _on_request_completed(result, response_code, headers, body):
	#if response_code == 200:
		#print("¡Victoria registrada con éxito!")
	#else:
		#print("Hubo un error al registrar la victoria: " + str(response_code))
