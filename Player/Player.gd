extends KinematicBody2D


export (int) var speed = 50

var velocity = Vector2()

func _ready():
	position = Vector2(get_viewport().size.x/2, get_viewport().size.y/2)
	set_process(true)

func _process(delta):
	get_input()
	move_and_slide(velocity)

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func init(nickname, start_position, is_slave):
	$GUI/Nickname.text = nickname
	global_position = start_position
	if is_slave:
		print("I am a slave")
		$Sprite.texture = load('res://Assets/tile_0158.png')
