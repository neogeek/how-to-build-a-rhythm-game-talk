extends Sprite2D

@export var bpm: int = 60
@export var hit_window: float = 0.15
@export var error_color: Color = Color(1.0, 0.8, 0.8, 1.0)
@export var success_color: Color = Color(1.0, 0.8, 0.8, 1.0)

@export var audio_stream_player: AudioStreamPlayer

@export var label_bad: PackedScene
@export var label_nice: PackedScene

@export var label_offset: Vector2 = Vector2(0, -175)

var elapsed_time: float = 0

var is_on_the_beat_triggerd: bool = false

var sfx_enabled: bool = true

var sfx_trigger_count: int = 0

var sfx_trigger_count_max: int = 4

func _process(delta: float) -> void:
	elapsed_time += delta

	var is_on_the_beat: bool = rhythm_game_utilities.is_on_the_beat(bpm, elapsed_time, 0.05)

	if !is_on_the_beat_triggerd && is_on_the_beat:
		trigger_scale_pulse()
		if sfx_enabled:
			audio_stream_player.play()
			sfx_trigger_count += 1
			if sfx_trigger_count >= sfx_trigger_count_max:
				sfx_enabled = false
		is_on_the_beat_triggerd = true
	elif is_on_the_beat_triggerd && !is_on_the_beat:
		is_on_the_beat_triggerd = false

func trigger_scale_pulse() -> void:
	var tween: Tween = create_tween()

	tween.tween_property(self , "scale", Vector2.ONE * 1.25, 0.1) \
		.set_trans(Tween.TRANS_CUBIC) \
		.set_ease(Tween.EASE_OUT)

	tween.tween_property(self , "scale", Vector2.ONE, 0.5) \
		.set_trans(Tween.TRANS_SINE) \
		.set_ease(Tween.EASE_IN_OUT)

func _input(event: InputEvent) -> void:
	var is_on_the_beat: bool = rhythm_game_utilities.is_on_the_beat(bpm, elapsed_time, hit_window)

	if event.is_action_pressed("guitar_strum_up"):
		if !is_on_the_beat:
			flash_error_tint()
		else:
			flash_sucess_tint()
			trigger_event_action("slide_previous")
	elif event.is_action_pressed("guitar_strum_down"):
		if !is_on_the_beat:
			flash_error_tint()
		else:
			flash_sucess_tint()
			trigger_event_action("slide_next")

func trigger_event_action(action: StringName) -> void:
	var synthetic_event: InputEventAction = InputEventAction.new()
	synthetic_event.action = action
	synthetic_event.pressed = true
	Input.parse_input_event(synthetic_event)

func flash_error_tint() -> void:
	var tween: Tween = create_tween()

	tween.tween_property(self , "modulate", error_color, 0.1)
	tween.tween_interval(0.25)
	tween.tween_property(self , "modulate", Color.WHITE, 0.1)

	shake_sprite()

	var label: Node2D = label_bad.instantiate()
	self.get_parent().get_parent().add_child(label)
	label.global_position = global_position + label_offset

func flash_sucess_tint() -> void:
	var tween: Tween = create_tween()

	tween.tween_property(self , "modulate", success_color, 0.1)
	tween.tween_interval(0.25)
	tween.tween_property(self , "modulate", Color.WHITE, 0.1)

	var label: Node2D = label_nice.instantiate()
	self.get_parent().get_parent().add_child(label)
	label.global_position = global_position + label_offset

func shake_sprite(intensity: float = 8.0, duration: float = 0.25) -> void:
	var tween: Tween = create_tween()

	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)

	var origin_position: Vector2 = self.position
	var shake_count: int = 10
	var step_time: float = duration / shake_count

	for i: int in range(shake_count):
		var temp_offset: Vector2 = Vector2(
			randf_range(-intensity, intensity),
			randf_range(-intensity, intensity)
		)

		tween.tween_property(self , "position", origin_position + temp_offset, step_time)

	tween.tween_property(self , "position", origin_position, step_time)
