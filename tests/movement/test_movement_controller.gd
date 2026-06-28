class_name TestMovementController

static func run() -> void:
	test_empty_turn()
	test_frame_indexing()
	test_single_ship_move()
	test_single_ship_turn()
	test_cumulative_moves()
	test_turn_then_move()
	test_mismatched_action_count()
	Assert.summarize_single("TestMovementController")

static func test_empty_turn() -> void:
	var mt: MovementTurn = MovementTurn.new([])
	Assert.is_eq(MovementController.get_frames(mt), [], "Empty turn returns no frames")

static func test_frame_indexing() -> void:
	var s: Ship = Ship.new(1)
	var ma1: MovementAction = MovementAction.new(MovementAction.Type.MOVE, 1)
	var ma2: MovementAction = MovementAction.new(MovementAction.Type.MOVE, 2)
	var mt: MovementTurn = MovementTurn.new([s])
	mt.append(s, [ma1, ma2])
	var frames = MovementController.get_frames(mt)
	Assert.is_eq(frames[1].combined_frame[s].frame, 1, "Frame index stores correctly")

static func test_single_ship_move() -> void:
	var s: Ship = Ship.new(1)
	var ma: MovementAction = MovementAction.new(MovementAction.Type.MOVE, 1)
	var mt: MovementTurn = MovementTurn.new([s])
	mt.append(s, [ma])
	var frames = MovementController.get_frames(mt)
	Assert.is_eq(frames[0].combined_frame[s].position, 1, "Single MOVE action produces frame with correct position")

static func test_single_ship_turn() -> void:
	var s: Ship = Ship.new(1)
	var ma: MovementAction = MovementAction.new(MovementAction.Type.TURN)
	var mt: MovementTurn = MovementTurn.new([s])
	mt.append(s, [ma])
	var frames = MovementController.get_frames(mt)
	Assert.is_eq(frames[0].combined_frame[s].facing, Ship.Facing.NEG, "Single TURN action produces frame with correct facing")

static func test_cumulative_moves() -> void:
	var s: Ship = Ship.new(1)
	var ma1: MovementAction = MovementAction.new(MovementAction.Type.MOVE, 1)
	var ma2: MovementAction = MovementAction.new(MovementAction.Type.MOVE, 2)
	var mt: MovementTurn = MovementTurn.new([s])
	mt.append(s, [ma1, ma2])
	var frames = MovementController.get_frames(mt)
	Assert.is_eq(frames[1].combined_frame[s].position, 3, "Multiple moves properly affect position properly")

static func test_turn_then_move() -> void:
	var s: Ship = Ship.new(1)
	var ma1: MovementAction = MovementAction.new(MovementAction.Type.TURN)
	var ma2: MovementAction = MovementAction.new(MovementAction.Type.MOVE, 2)
	var mt: MovementTurn = MovementTurn.new([s])
	mt.append(s, [ma1, ma2])
	var frames = MovementController.get_frames(mt)
	Assert.is_eq(frames[1].combined_frame[s].position, -2, "Turning them moving affects position properly")

static func test_mismatched_action_count() -> void:
	var s1: Ship = Ship.new(1)
	var ma1: MovementAction = MovementAction.new(MovementAction.Type.TURN)
	var s2: Ship = Ship.new(1)
	var ma21: MovementAction = MovementAction.new(MovementAction.Type.MOVE, 1)
	var ma22: MovementAction = MovementAction.new(MovementAction.Type.TURN)
	var mt: MovementTurn = MovementTurn.new([s1, s2])
	mt.append(s1, [ma1])
	mt.append(s2, [ma21, ma22])
	var frames = MovementController.get_frames(mt)
	Assert.is_eq(frames.size(), 2, "Frame count takes max value")
	Assert.is_eq(frames[1].combined_frame[s1].position, 0, "Ship not mutated by empty action")
	Assert.is_eq(frames[1].combined_frame[s2].facing, Ship.Facing.NEG, "Ship with more actions executes extra actions correctly")