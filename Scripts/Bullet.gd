extends Area2D
var velocidade = 500

func _ready():
	$CollisionShape2D.scale.x = 0.5
	$CollisionShape2D.scale.y = 0.5
	
	$Sprite.scale = Vector2(0.5, 0.5)
	pass # Replace with function body.

func _physics_process(delta):
	position -= transform.y * velocidade * delta


func _on_Bullet_body_entered(body):
	$".".queue_free()
	if body.name == "Machine1" || body.name == "Machine2":
		$MorteExplosao.play()
		body.queue_free()
		get_tree().reload_current_scene()
		
	pass # Replace with function body.

