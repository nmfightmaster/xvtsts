class_name TestMovementAction

static func run() -> void:
	test_default_move()
	test_move()
	test_turn()
	Assert.summarize()

static func test_default_move() -> void:
	var m = MovementAction.create_move()
	Assert.is_true(m.distance == 1 and m.type == MovementAction.Type.MOVE, "Default MOVE created with distance 1")

static func test_move() -> void:
	var m = MovementAction.create_move(2)
	Assert.is_true(m.distance == 2 and m.type == MovementAction.Type.MOVE, "MOVE created with specified distance")

static func test_turn() -> void:
	var m = MovementAction.create_turn()
	Assert.is_true(m.type == MovementAction.Type.TURN and m.distance == 0, "TURN created")
