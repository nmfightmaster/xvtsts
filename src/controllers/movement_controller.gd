class_name MovementController

static func _get_frame_count(movement_actions: Dictionary[Ship, Array]) -> int:
	var frames = 0
	for ship in movement_actions:
		if movement_actions[ship].size() > frames:
			frames = movement_actions[ship].size()
	return frames

static func _get_ship_frame(movement_actions: Dictionary[Ship, Array], ship: Ship, frame: int) -> Dictionary[String, int]:
	if (frame < movement_actions[ship].size()):
		var action = movement_actions[ship][frame]
		match action.type:
			MovementAction.Type.MOVE:
				ship.move(action.distance)
			MovementAction.Type.TURN:
				ship.turn()
	return {"position": ship.position, "facing": ship.facing}

static func _get_combined_frame(movement_actions: Dictionary[Ship, Array], frame: int) -> Dictionary[Ship, Dictionary]:
	var combined_frame = {}
	for ship in movement_actions:
		combined_frame[ship] = _get_ship_frame(movement_actions, ship, frame)
	return combined_frame

static func get_frames(movement_actions: Dictionary[Ship, Array]) -> Array[Dictionary]:
	var frames = []
	var frame_count = _get_frame_count(movement_actions)
	for frame in frame_count:
		frames.append(_get_combined_frame(movement_actions, frame))
	return frames
