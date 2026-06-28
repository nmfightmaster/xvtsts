class_name TestMovementTurn

static func run() -> void:
	test_get_actions()
	test_get_ships()
	test_clear()
	test_accumulation()
	Assert.summarize_single("MovementTurn")

static func test_get_actions() -> void:
	var s1: Ship = Ship.new(1)
	var ma1: MovementAction = MovementAction.new(MovementAction.Type.MOVE, 1)
	var s2: Ship = Ship.new(1)
	var ma2: MovementAction = MovementAction.new(MovementAction.Type.MOVE, 1)
	var sa: Array[Ship] = [s1, s2]
	var maa1: Array[MovementAction] = [ma1]
	var maa2: Array[MovementAction] = [ma2]
	var mt: MovementTurn = MovementTurn.new(sa)
	mt.append(s1, maa1)
	mt.append(s2, maa2)
	Assert.is_true(mt.get_actions(s1) == maa1 and mt.get_actions(s2) == maa2, "Can assign [MovementAction] for multiple Ships without clobbering")

static func test_get_ships() -> void:
	var s1: Ship = Ship.new(1)
	var s2: Ship = Ship.new(1)
	var sa: Array[Ship] = [s1, s2]
	var mt: MovementTurn = MovementTurn.new(sa)
	Assert.is_eq(mt.get_ships(), sa, "Can return all registered Ships") # assumes insertion order!

static func test_clear() -> void:
	var s1: Ship = Ship.new(1)
	var ma1: MovementAction = MovementAction.new(MovementAction.Type.MOVE, 1)
	var s2: Ship = Ship.new(1)
	var ma2: MovementAction = MovementAction.new(MovementAction.Type.MOVE, 1)
	var sa: Array[Ship] = [s1, s2]
	var maa1: Array[MovementAction] = [ma1]
	var maa2: Array[MovementAction] = [ma2]
	var mt: MovementTurn = MovementTurn.new(sa)
	mt.append(s1, maa1)
	mt.append(s2, maa2)
	mt.clear(s1)
	Assert.is_true(mt.get_actions(s1) == [] and mt.get_actions(s2) == maa2, "Can clear [MovementAction] for Ship without clobbering")

static func test_accumulation() -> void:
	var s: Ship = Ship.new(1)
	var ma1: MovementAction = MovementAction.new(MovementAction.Type.MOVE, 1)
	var ma2: MovementAction = MovementAction.new(MovementAction.Type.MOVE, 2)
	var maa1: Array[MovementAction] = [ma1]
	var maa2: Array[MovementAction] = [ma2]
	var mt: MovementTurn = MovementTurn.new([s])
	mt.append(s, maa1)
	mt.append(s, maa2)
	Assert.is_eq(mt.get_actions(s), [ma1, ma2], "Can append multiple arrays of MovementActions")
