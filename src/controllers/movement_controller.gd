class_name MovementController

static func _get_frame_count(state: TurnState) -> int:
	var frames: int = 0
	for ship in state.get_ships():
		var actions: Array[MovementAction] = state.get_actions(ship)
		if actions.size() > frames:
			frames = actions.size()
	return frames

static func _get_ship_frame(state: TurnState, ship: Ship, frame: int) -> Dictionary[String, int]:
	var actions: Array[MovementAction] = state.get_actions(ship)
	if (frame < actions.size()):
		var action: MovementAction = actions[frame]
		match action.type:
			MovementAction.Type.MOVE:
				ship.move(action.distance)
			MovementAction.Type.TURN:
				ship.turn()
	return {"position": ship.position, "facing": ship.facing}

static func _get_combined_frame(state: TurnState, frame: int) -> Dictionary[Ship, Dictionary]:
	var combined_frame: Dictionary[Ship, Dictionary] = {}
	for ship in state.get_ships():
		combined_frame[ship] = _get_ship_frame(state, ship, frame)
	return combined_frame

static func get_frames(state: TurnState) -> Array[Dictionary]:
	var frames: Array[Dictionary] = []
	var frame_count: int = _get_frame_count(state)
	for frame in frame_count:
		frames.append(_get_combined_frame(state, frame))
	return frames
