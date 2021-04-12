extends Area2D

const points = 100

func _on_PillBig_body_entered(body):
	queue_free()
	body.add_points(points)
	body.start_hunter_mode()
