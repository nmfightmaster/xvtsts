class_name TestShip

static func run() -> void:
	test_move_pos()
	test_move_neg()
	test_move_zero()
	test_multiple_moves()
	test_turn_neg()
	test_turn_pos()
	test_take_damage()
	test_take_lethal_damage()
	test_take_overkill_damage()
	test_can_hit_frontal_s2()
	test_cannot_hit_rear_s2()
	test_cannot_hit_same_position_s2()
	test_can_hit_with_neg_facing()
	Assert.summarize_single("Ship")

static func test_move_pos() -> void:
	var s: Ship = Ship.new(1)
	s.move(1)
	Assert.is_eq(s.position, 1, "Facing/moving positively changes position positively")

static func test_move_neg() -> void:
	var s: Ship = Ship.new(1, 0, Ship.Facing.NEG)
	s.move(1)
	Assert.is_eq(s.position, -1, "Facing/moving negatively changes position negatively")

static func test_move_zero() -> void:
	var s: Ship = Ship.new(1)
	s.move(0)
	Assert.is_eq(s.position, 0, "Moving 0 doesn't affect position")

static func test_multiple_moves() -> void:
	var s: Ship = Ship.new(1)
	s.move(1)
	s.move(2)
	Assert.is_eq(s.position, 3, "Moving multiple times properly affects position")

static func test_turn_neg() -> void:
	var s: Ship = Ship.new(1)
	s.turn()
	Assert.is_true(s.facing == Ship.Facing.NEG, "Turning while facing positive inverts facing")

static func test_turn_pos() -> void:
	var s: Ship = Ship.new(1, 0, Ship.Facing.NEG)
	s.turn()
	Assert.is_true(s.facing == Ship.Facing.POS, "Turning while facing negative inverts facing")

static func test_take_damage() -> void:
	var hp: int = 2
	var dmg: int = 1
	var s: Ship = Ship.new(hp)
	s.take_damage(dmg)
	Assert.is_eq(s.health, hp - dmg, "Taking damage reduces health")

static func test_take_lethal_damage() -> void:
	var hp: int = 1
	var dmg: int = 1
	var s: Ship = Ship.new(hp)
	s.take_damage(dmg)
	Assert.is_eq(s.health, 0, "Taking lethal damage sets health to 0")

static func test_take_overkill_damage() -> void:
	var hp: int = 1
	var dmg: int = 2
	var s: Ship = Ship.new(hp)
	s.take_damage(dmg)
	Assert.is_eq(s.health, 0, "Taking overkill damage still sets health to 0")

static func test_can_hit_frontal_s2() -> void:
	var s1: Ship = Ship.new(1, 0)
	var s2: Ship = Ship.new(1, 1)
	Assert.is_true(s1.can_hit(s2), "Can hit frontal s2")

static func test_cannot_hit_rear_s2() -> void:
	var s1: Ship = Ship.new(1, 0, Ship.Facing.NEG)
	var s2: Ship = Ship.new(1, 1)
	Assert.is_true(not s1.can_hit(s2), "Cannot hit rear s2")

static func test_cannot_hit_same_position_s2() -> void:
	var s1: Ship = Ship.new(1, 1)
	var s2: Ship = Ship.new(1, 1)
	Assert.is_true(not s1.can_hit(s2), "Cannot hit same-position s2")

static func test_can_hit_with_neg_facing() -> void:
	var s1: Ship = Ship.new(1, 1, Ship.Facing.NEG)
	var s2: Ship = Ship.new(1, 0)
	Assert.is_true(s1.can_hit(s2), "Can hit with negative facing")
