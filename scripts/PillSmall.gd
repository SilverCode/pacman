extends Area2D

const points = 10

func _on_PillSmall_body_entered(body):
	queue_free()
	body.add_points(points)
