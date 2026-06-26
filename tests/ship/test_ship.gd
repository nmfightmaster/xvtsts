class_name TestShip
extends RefCounted

func run() -> void:
	var a = Assert.new()
	test_move_pos(a)
	test_move_neg(a)
	test_turn(a)
	test_take_damage(a)
	test_take_lethal_damage(a)
	test_can_hit_frontal_enemy(a)
	test_cannot_hit_rear_enemy(a)
	test_cannot_hit_same_position_enemy(a)
	a.summarize()

func test_move_pos(a: Assert) -> void:
	var s = Ship.new(1)
	s.move(1)
	a.is_eq(s.position, 1, "Facing/moving positively changes position positively.")

func test_move_neg(a: Assert) -> void:
	var s = Ship.new(1, 0, -1)
	s.move(1)
	a.is_eq(s.position, -1, "Facing/moving negatively changes position negatively.")

func test_turn(a: Assert) -> void:
	var s = Ship.new(1)
	var start_facing = s.facing
	s.turn()
	a.is_true(start_facing == s.facing * -1, "Turning inverts facing")

func test_take_damage(a: Assert) -> void:
	var hp = 2
	var dmg = 1
	var s = Ship.new(hp)
	s.take_damage(dmg)
	a.is_eq(s.health, hp - dmg, "Taking damage reduces health")

func test_take_lethal_damage(a: Assert) -> void:
	var hp = 1
	var dmg = 1
	var s = Ship.new(hp)
	s.take_damage(dmg)
	a.is_eq(s.health, 0, "Taking lethal damage sets health to 0")

func test_can_hit_frontal_enemy(a: Assert) -> void:
	var player = Ship.new(1, 0)
	var enemy = Ship.new(1, 1)
	a.is_true(player.can_hit(enemy), "Can hit frontal enemy")

func test_cannot_hit_rear_enemy(a: Assert) -> void:
	var player = Ship.new(1, 0, -1)
	var enemy = Ship.new(1, 1)
	a.is_true(!player.can_hit(enemy), "Cannot hit rear enemy")

func test_cannot_hit_same_position_enemy(a: Assert) -> void:
	var player = Ship.new(1, 1)
	var enemy = Ship.new(1, 1)
	a.is_true(!player.can_hit(enemy), "Cannot hit same-position enemy")
