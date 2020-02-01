extends KinematicBody2D

export var speed = 400
var screen_size
var turn = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	#position += velocity * delta
	var amiguinho = move_and_collide(velocity * delta)
	 
	if  turn == false and amiguinho:
		if(amiguinho.get_collider().get_name() == "Npc2"):	
			#print(amiguinho.get_collider().set_dano(5))
			turn = true

	

	


func _on_CoolDown_timeout():
	turn = false
