class_name TestShip

static func run() -> void:
	test_move_pos()
	test_move_neg()
	test_turn()
	test_take_damage()
	test_take_lethal_damage()
	test_can_hit_frontal_enemy()
	test_cannot_hit_rear_enemy()
	test_cannot_hit_same_position_enemy()
	Assert.summarize_single("Ship")

static func test_move_pos() -> void:
	var s: Ship = Ship.new(1)
	s.move(1)
	Assert.is_eq(s.position, 1, "Facing/moving positively changes position positively.")

static func test_move_neg() -> void:
	var s: Ship = Ship.new(1, 0, Ship.Facing.NEG)
	s.move(1)
	Assert.is_eq(s.position, -1, "Facing/moving negatively changes position negatively.")

static func test_turn() -> void:
	var s: Ship = Ship.new(1)
	var start_facing: int = s.facing
	s.turn()
	Assert.is_true(start_facing == s.facing * -1, "Turning inverts facing")

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

static func test_can_hit_frontal_enemy() -> void:
	var player: Ship = Ship.new(1, 0)
	var enemy: Ship = Ship.new(1, 1)
	Assert.is_true(player.can_hit(enemy), "Can hit frontal enemy")

static func test_cannot_hit_rear_enemy() -> void:
	var player: Ship = Ship.new(1, 0, Ship.Facing.NEG)
	var enemy: Ship = Ship.new(1, 1)
	Assert.is_true(not player.can_hit(enemy), "Cannot hit rear enemy")

static func test_cannot_hit_same_position_enemy() -> void:
	var player: Ship = Ship.new(1, 1)
	var enemy: Ship = Ship.new(1, 1)
	Assert.is_true(not player.can_hit(enemy), "Cannot hit same-position enemy")
