extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_LimiteEsquerda_body_entered(body):
	
	body.position.x = $LimiteDireita/Direita.position.x - 80
	pass # Replace with function body.


func _on_LimiteDireita_body_entered(body):
	body.position.x = 50
	pass # Replace with function body.


func _on_LimiteCima_body_entered(body):
	body.position.y = $LimiteBaixo/Baixo.position.y - 80 
	pass # Replace with function body.


func _on_LimiteBaixo_body_entered(body):
	body.position.y = 50
	pass # Replace with function body.
