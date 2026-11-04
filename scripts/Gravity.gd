extends CharacterBody2D
var sp: float = 500
var jumpvel = -700
@onready var sprite = $jug
@onready var time = $Coyote
var jump = false
@onready var ene = $Enemy
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity()*delta


func _process(delta: float):
	if Input.is_action_pressed("sprint"):
		sp =1000
	else:
		sp= 500
	var positionl= Input.get_axis("left", "right")
	position.x += positionl * sp * delta
	
	if Input.is_action_just_pressed("Jump") and is_on_floor()|| !time.is_stopped():
		velocity.y=jumpvel
	if Input.is_action_just_pressed("Jump") and is_on_wall():
		velocity.y = jumpvel
	if Input.is_action_just_pressed("Jump") and is_on_wall() and is_on_floor():
		velocity.y = jumpvel
	if position.y>500:
		position=Vector2(1,1)
	move_and_slide()
