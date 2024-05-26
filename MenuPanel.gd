extends Panel

var dragging = false
var drag_offset = Vector2()

var pause_button = null

var pauseCheck = false

# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	pause_button = get_parent().get_node("NavBar/SpeedControlPanel/PauseButton")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("menu open"):
		visible = !visible

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Start dragging and calculate the offset when the mouse button is pressed.
			dragging = true
			drag_offset = get_global_mouse_position() - global_position
		else:
			dragging = false
		accept_event()

	if event is InputEventMouseMotion and dragging:
		# Update the panel's global position smoothly using the drag offset.
		global_position = get_global_mouse_position() - drag_offset
		accept_event()
	
	if event is InputEventMouseMotion and dragging:
		# Calculate new position with the drag offset
		var new_global_position = get_global_mouse_position() - drag_offset
		# Clamp new position within the viewport boundaries
		new_global_position = clamp_position_within_viewport(new_global_position)
		# Update the panel's global position
		global_position = new_global_position
		accept_event()
	

func clamp_position_within_viewport(global_pos):
	var viewport_size = get_viewport_rect().size
	# Get the size of the Control node explicitly if rect_size is not recognized
	var panel_size = self.rect_size if "rect_size" in self else self.get_rect().size
	var clamped_x = clamp(global_pos.x, 0, viewport_size.x - panel_size.x)
	var clamped_y = clamp(global_pos.y, 80, viewport_size.y - panel_size.y)
	return Vector2(clamped_x, clamped_y)


func _on_menu_pause_check_toggled(toggled_on):
	pauseCheck = toggled_on