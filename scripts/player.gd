extends CharacterBody2D

var http_request = HTTPRequest.new() # Crear una nueva instancia de HTTPRequest

# Called when the node enters the scene tree for the first time.
func _ready():
	$Animation_Player.play("walk_mode")
	self.add_child(http_request) # Añadirlo como un nodo hijo

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * 200
	move_and_slide()
