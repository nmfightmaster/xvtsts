class_name MovementController

static func _get_frame_count(movement_turn: MovementTurn) -> int:
	var frames: int = 0
	for ship in movement_turn.get_ships():
		var actions: Array[MovementAction] = movement_turn.get_actions(ship)
		if actions.size() > frames:
			frames = actions.size()
	return frames

static func _get_ship_frame(movement_turn: MovementTurn, ship: Ship, frame: int) -> MovementFrame:
	var actions: Array[MovementAction] = movement_turn.get_actions(ship)
	if (frame < actions.size()):
		var action: MovementAction = actions[frame]
		match action.type:
			MovementAction.Type.MOVE:
				ship.move(action.distance)
			MovementAction.Type.TURN:
				ship.turn()
	return MovementFrame.new(frame, ship.position, ship.facing)

static func _get_combined_frame(movement_turn: MovementTurn, frame: int) -> CombinedMovementFrame:
	var ships: Array[Ship] = movement_turn.get_ships()
	var combined_frame: CombinedMovementFrame = CombinedMovementFrame.new()
	for ship in ships:
		combined_frame.push(ship, _get_ship_frame(movement_turn, ship, frame))
	return combined_frame

static func get_frames(movement_turn: MovementTurn) -> Array[CombinedMovementFrame]:
	var frames: Array[CombinedMovementFrame] = []
	var frame_count: int = _get_frame_count(movement_turn)
	for frame in frame_count:
		frames.append(_get_combined_frame(movement_turn, frame))
	return frames
