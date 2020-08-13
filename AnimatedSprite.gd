extends AnimatedSprite


func _ready():
	set_process(true)

func _process(delta):
	var move_direction = Vector2()
	var LEFT = Input.is_action_pressed("move_left")
	var UP = Input.is_action_pressed("move_up")
	var RIGHT = Input.is_action_pressed("move_right")
	var DOWN = Input.is_action_pressed("move_down")

	move_direction.x = int(RIGHT) - int(LEFT)
	move_direction.y = int(DOWN) - int(UP)

	if LEFT || RIGHT || UP || DOWN:
		facing = move_direction

	var animation = direction2str(facing)
	self.set_animation(animation)

var directions = ["right", "down_right", "down", "down_left", "left", "up_left", "up", "up_right"]
var facing = Vector2()

func direction2str(direction):
	var angle = direction.angle()
	if angle < 0:
		angle += 2 * PI
	var index = round(angle / PI * 4)
	return directions[index]