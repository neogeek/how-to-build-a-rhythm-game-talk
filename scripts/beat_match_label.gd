extends Node2D

func _ready() -> void:
	var tween: Tween = create_tween()

	tween.set_parallel(true)

	tween.tween_property(self , "scale", Vector2(1.25, 1.25), 0.5) \
		.set_trans(Tween.TRANS_SINE) \
		.set_ease(Tween.EASE_IN_OUT)

	tween.tween_property(self , "modulate:a", 0.0, 0.5) \
		.set_trans(Tween.TRANS_SINE) \
		.set_ease(Tween.EASE_IN_OUT)

	tween.tween_property(self , "position", position + Vector2(0, -100), 0.5) \
		.set_trans(Tween.TRANS_CUBIC) \
		.set_ease(Tween.EASE_OUT) \
		.as_relative()

	tween.chain().tween_callback(queue_free)
