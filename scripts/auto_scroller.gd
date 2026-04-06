extends Node2D

class_name AutoScroller

var initial_offset_time: float = 0

var latency_delay: float = 0.65

var current_event_index: int = 0;

var events: Array[Dictionary] = [
	{"time": 40.71, "event_name": "success", "timestamp": "00:40", "id": 1},
	{"time": 74.71, "event_name": "success", "timestamp": "01:14", "id": 2},
	{"time": 124.71, "event_name": "success", "timestamp": "02:04", "id": 3},
	{"time": 134.71, "event_name": "success", "timestamp": "02:14", "id": 4},
	{"time": 153.71, "event_name": "success", "timestamp": "02:33", "id": 5},
	{"time": 163.71, "event_name": "success", "timestamp": "02:43", "id": 6},
	{"time": 173.0, "event_name": "fail", "timestamp": "02:53", "id": 7},
	{"time": 180.71, "event_name": "success", "timestamp": "03:00", "id": 8},
	{"time": 192.85, "event_name": "fail", "timestamp": "03:12", "id": 9},
	{"time": 193.71, "event_name": "success", "timestamp": "03:13", "id": 10},
	{"time": 212.71, "event_name": "success", "timestamp": "03:32", "id": 11},
	{"time": 242.71, "event_name": "success", "timestamp": "04:02", "id": 12},
	{"time": 246.85, "event_name": "fail", "timestamp": "04:06", "id": 13},
	{"time": 247.85, "event_name": "fail", "timestamp": "04:07", "id": 14},
	{"time": 251.71, "event_name": "success", "timestamp": "04:11", "id": 15},
	{"time": 273.71, "event_name": "success", "timestamp": "04:33", "id": 16},
	{"time": 276.71, "event_name": "success", "timestamp": "04:36", "id": 17},
	{"time": 314.71, "event_name": "success", "timestamp": "05:14", "id": 18},
	{"time": 346.85, "event_name": "fail", "timestamp": "05:46", "id": 19},
	{"time": 348.71, "event_name": "success", "timestamp": "05:48", "id": 20},
	{"time": 368.71, "event_name": "success", "timestamp": "06:08", "id": 21},
	{"time": 372.85, "event_name": "fail", "timestamp": "06:12", "id": 22},
	{"time": 375.71, "event_name": "success", "timestamp": "06:15", "id": 23},
	{"time": 399.71, "event_name": "success", "timestamp": "06:39", "id": 24},
	{"time": 416.71, "event_name": "success", "timestamp": "06:56", "id": 25},
	{"time": 438.85, "event_name": "fail", "timestamp": "07:18", "id": 26},
	{"time": 440.85, "event_name": "fail", "timestamp": "07:20", "id": 27},
	{"time": 443.71, "event_name": "success", "timestamp": "07:23", "id": 28},
	{"time": 478.71, "event_name": "success", "timestamp": "07:58", "id": 29},
	{"time": 483.71, "event_name": "success", "timestamp": "08:03", "id": 30},
	{"time": 489.71, "event_name": "success", "timestamp": "08:09", "id": 31},
	{"time": 506.71, "event_name": "success", "timestamp": "08:26", "id": 32},
	{"time": 521.85, "event_name": "fail", "timestamp": "08:41", "id": 33},
	{"time": 522.71, "event_name": "success", "timestamp": "08:42", "id": 34},
	{"time": 581.85, "event_name": "fail", "timestamp": "09:41", "id": 35},
	{"time": 583.71, "event_name": "success", "timestamp": "09:43", "id": 36},
	{"time": 586.71, "event_name": "success", "timestamp": "09:46", "id": 37},
	{"time": 599.71, "event_name": "success", "timestamp": "09:59", "id": 38},
	{"time": 634.85, "event_name": "fail", "timestamp": "10:34", "id": 39},
	{"time": 636.85, "event_name": "fail", "timestamp": "10:36", "id": 40},
	{"time": 637.71, "event_name": "success", "timestamp": "10:37", "id": 41},
	{"time": 657.71, "event_name": "success", "timestamp": "10:57", "id": 42},
	{"time": 670.85, "event_name": "fail", "timestamp": "11:11", "id": 43},
	{"time": 674.71, "event_name": "success", "timestamp": "11:14", "id": 44},
	{"time": 689.71, "event_name": "success", "timestamp": "11:29", "id": 45},
	{"time": 714.71, "event_name": "success", "timestamp": "11:54", "id": 46},
	{"time": 728.71, "event_name": "success", "timestamp": "12:08", "id": 47},
	{"time": 731.71, "event_name": "success", "timestamp": "12:11", "id": 48},
	{"time": 734.71, "event_name": "success", "timestamp": "12:14", "id": 49},
	{"time": 742.71, "event_name": "success", "timestamp": "12:22", "id": 50},
	{"time": 749.71, "event_name": "success", "timestamp": "12:29", "id": 51},
	{"time": 762.71, "event_name": "success", "timestamp": "12:42", "id": 52},
	{"time": 766.71, "event_name": "success", "timestamp": "12:46", "id": 53},
	{"time": 777.71, "event_name": "success", "timestamp": "12:57", "id": 54},
	{"time": 813.71, "event_name": "success", "timestamp": "13:33", "id": 55},
	{"time": 821.71, "event_name": "success", "timestamp": "13:41", "id": 56},
	{"time": 835.71, "event_name": "success", "timestamp": "13:55", "id": 57},
	{"time": 847.71, "event_name": "success", "timestamp": "14:07", "id": 58},
	{"time": 851.85, "event_name": "fail", "timestamp": "14:11", "id": 59},
	{"time": 852.71, "event_name": "success", "timestamp": "14:12", "id": 60},
	{"time": 874.85, "event_name": "fail", "timestamp": "14:34", "id": 61},
	{"time": 883.85, "event_name": "fail", "timestamp": "14:43", "id": 62},
	{"time": 885.71, "event_name": "success", "timestamp": "14:45", "id": 63},
	{"time": 896.71, "event_name": "success", "timestamp": "14:56", "id": 64},
	{"time": 912.71, "event_name": "success", "timestamp": "15:12", "id": 65},
	{"time": 935.71, "event_name": "success", "timestamp": "15:35", "id": 66},
	{"time": 960.71, "event_name": "success", "timestamp": "16:00", "id": 67},
	{"time": 967.71, "event_name": "success", "timestamp": "16:07", "id": 68},
	{"time": 1003.71, "event_name": "success", "timestamp": "16:43", "id": 69},
	{"time": 1022.71, "event_name": "success", "timestamp": "17:02", "id": 70},
	{"time": 1037.71, "event_name": "success", "timestamp": "17:17", "id": 71},
	{"time": 1051.85, "event_name": "fail", "timestamp": "17:31", "id": 72},
	{"time": 1052.71, "event_name": "success", "timestamp": "17:32", "id": 73},
	{"time": 1059.71, "event_name": "success", "timestamp": "17:39", "id": 74},
	{"time": 1091.71, "event_name": "success", "timestamp": "18:11", "id": 75},
	{"time": 1120.71, "event_name": "success", "timestamp": "18:40", "id": 76},
	{"time": 1149.71, "event_name": "success", "timestamp": "19:09", "id": 77},
	{"time": 1234.71, "event_name": "success", "timestamp": "20:34", "id": 78},
	{"time": 1261.85, "event_name": "fail", "timestamp": "21:01", "id": 79},
	{"time": 1262.85, "event_name": "fail", "timestamp": "21:02", "id": 80},
	{"time": 1264.71, "event_name": "success", "timestamp": "21:04", "id": 81},
	{"time": 1277.71, "event_name": "success", "timestamp": "21:17", "id": 82},
	{"time": 1500.0, "event_name": "exit", "timestamp": "25:00", "id": 83}
]

func _process(_delta: float) -> void:
	if events.size() == 0:
		return

	var elapsed_time: float = SlidesTimer.get_elapsed_time()

	if elapsed_time >= events[0].time - latency_delay:
		if events[0].event_name == "success" or events[0].event_name == "fail":
			trigger_event_action("guitar_strum_down")
		elif events[0].event_name == "quit":
			get_tree().quit()

		events.pop_front()

func trigger_event_action(action: StringName) -> void:
	var synthetic_event: InputEventAction = InputEventAction.new()
	synthetic_event.action = action
	synthetic_event.pressed = true
	Input.parse_input_event(synthetic_event)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("event_next"):
		var time: float = events[0].time - 2

		SlidesTimer.set_elapsed_time(time)

var js_set_elapsed_time: JavaScriptObject

func _ready() -> void:
	if OS.get_name() == "Web":
		js_set_elapsed_time = JavaScriptBridge.create_callback(_on_js_set_elapsed_time)

		var window: JavaScriptObject = JavaScriptBridge.get_interface("window")

		window.set('externalCall', js_set_elapsed_time)

func _on_js_set_elapsed_time(args: Array) -> void:
	if args.size() > 0:
		var first_arg: Variant = args.front()
		if typeof(first_arg) == TYPE_FLOAT or typeof(first_arg) == TYPE_INT:
			var id: int = floor(first_arg)

			for event: Dictionary in events:
				if event.id < id:
					events.pop_front()
				else:
					break

			var time: float = events[0].time - 2

			SlidesTimer.set_elapsed_time(time)
