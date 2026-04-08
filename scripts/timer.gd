extends Control

class_name SlidesTimer

@export var label: Label

static var elapsed_time: float = 0

func _process(delta: float) -> void:
	elapsed_time += delta

	if label:
		label.text = format_time_with_ms(elapsed_time)

func format_time(time_in_seconds: float) -> String:
	var minutes: int = int(time_in_seconds / 60)
	var seconds: int = int(time_in_seconds) % 60
	return "%02d:%02d" % [minutes, seconds]

func format_time_with_ms(time_in_seconds: float) -> String:
	var minutes: int = int(time_in_seconds / 60)
	var seconds: int = int(time_in_seconds) % 60

	var msec: int = int(fmod(time_in_seconds, 1.0) * 1000)

	return "%02d:%02d.%03d" % [minutes, seconds, msec]

static func get_elapsed_time() -> float:
	return elapsed_time

static func set_elapsed_time(time: float) -> void:
	elapsed_time = time
