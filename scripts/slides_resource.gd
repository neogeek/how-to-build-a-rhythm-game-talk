extends Resource

class_name SlidesResource

@export var slides: Array[Texture2D]

var current_slide_index: int = 0

func get_current_slide_texture() -> Texture2D:
	if slides.is_empty():
		return null

	return slides[current_slide_index]

func get_next_slide_texture() -> Texture2D:
	if slides.is_empty():
		return null

	current_slide_index += 1
	current_slide_index = clamp(current_slide_index, 0, slides.size() - 1)

	return slides[current_slide_index]

func get_previous_slide_texture() -> Texture2D:
	if slides.is_empty():
		return null

	current_slide_index -= 1
	current_slide_index = clamp(current_slide_index, 0, slides.size() - 1)

	return slides[current_slide_index]
