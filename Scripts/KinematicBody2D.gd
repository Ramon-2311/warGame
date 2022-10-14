extends KinematicBody2D
export (PackedScene) var Bullet

var velocidade = Vector2.ZERO


func _physics_process(delta):
	velocidade.x = Input.get_action_strength("direita") - Input.get_action_strength("esquerda")
	velocidade.y = Input.get_action_strength("baixo") - Input.get_action_strength("cima")
	move_and_slide(velocidade*250)
	trocaSprite(velocidade)
	if (Input.is_action_just_pressed("shoot")):
		shoot()
	if velocidade.x !=0 or velocidade.y != 0:
		if !$AudioTank.playing:
			$AudioTank.play()	
	else:
		if $AudioTank.playing:
			$AudioTank.stop()	
	pass

func shoot():
	var canhaoA = Bullet.instance()
	var canhaoB = Bullet.instance()
	owner.add_child(canhaoA)
	owner.add_child(canhaoB)
	canhaoA.transform = $Canhao1.global_transform
	canhaoB.transform = $Canhao2.global_transform
	$Tiro.play()
	
func trocaSprite(vel):
	if(vel.x == 1):
		$".".rotation_degrees = 90
	if(vel.x == -1):
		$".".rotation_degrees = 270
	if(vel.y == 1):
		$".".rotation_degrees = 180
	if(vel.y == -1):
		$".".rotation_degrees = 0
		
	if(vel.y == -1 and vel.x == -1):
		$".".rotation_degrees = 270+45
	if(vel.y == -1 and vel.x == 1):
		$".".rotation_degrees = 45
	if(vel.y == 1 and vel.x == 1):
		$".".rotation_degrees = 180-45
	if(vel.y == 1 and vel.x == -1):
		$".".rotation_degrees = 180+45
	pass


func _ready():
	pass

