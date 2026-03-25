extends TextureRect

@export var slides: SlidesResource

func _ready() -> void:
	texture = slides.get_current_slide_texture()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("slide_next"):
		texture = slides.get_next_slide_texture()
	elif event.is_action_pressed("slide_previous"):
		texture = slides.get_previous_slide_texture()
	elif event.is_action_pressed("slides_quit"):
		get_tree().quit()
