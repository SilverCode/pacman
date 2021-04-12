extends Area2D

export(NodePath) var target_path
onready var target = get_node(target_path)
var enabled = true

func _on_Warp_body_entered(body):
	if enabled:
		teleport(target, body)

func _on_Warp_body_exited(body):
	enabled = true
	
func teleport(target, actor):
	actor.position = target.position
	target.enabled = false
