class_name TestCombinedMovementFrame

static func run() -> void:
	test_push()
	test_push_no_clobber()
	test_overwrite()
	Assert.summarize_single("CombinedMovementFrame")

static func test_push() -> void:
	var c: CombinedMovementFrame = CombinedMovementFrame.new()
	var s1: Ship = Ship.new(1)
	var m1: MovementFrame = MovementFrame.new(1, -1, Ship.Facing.POS)
	c.push(s1, m1)
	Assert.is_eq(c.combined_frame[s1], m1, "Can store MovementFrame keyed by Ship")

static func test_push_no_clobber() -> void:
	var c: CombinedMovementFrame = CombinedMovementFrame.new()
	var s1: Ship = Ship.new(1)
	var m1: MovementFrame = MovementFrame.new(1, -1, Ship.Facing.POS)
	var s2: Ship = Ship.new(1)
	var m2: MovementFrame = MovementFrame.new(1, 1, Ship.Facing.NEG)
	c.push(s1, m1)
	c.push(s2, m2)
	Assert.is_true(c.combined_frame[s1] == m1 and c.combined_frame[s2] == m2, "Second Ship push does not overwrite first")

static func test_overwrite() -> void:
	var c: CombinedMovementFrame = CombinedMovementFrame.new()
	var s1: Ship = Ship.new(1)
	var m1: MovementFrame = MovementFrame.new(1, -1, Ship.Facing.POS)
	var m2: MovementFrame = MovementFrame.new(1, 2, Ship.Facing.NEG)
	c.push(s1, m1)
	c.push(s1, m2)
	Assert.is_eq(c.combined_frame[s1], m2, "Second push for existing Ship overwrites")

