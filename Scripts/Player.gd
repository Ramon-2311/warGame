extends Node2D

export var esta_tocando = true

func _physics_process(delta):
	if Input.is_action_pressed('mute'):
		esta_tocando = not esta_tocando
#
	if esta_tocando:
		if !$GOW.playing:
			$GOW.play()

	else: 
		if $GOW.playing:
			$GOW.stop()
