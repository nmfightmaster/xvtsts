class_name TestCapacitor
extends RefCounted

func run() -> void:
	var a = Assert.new()
	test_configure_valid_level(a)
	test_configure_invalid_level(a)
	test_valid_playable_card(a)
	test_invalid_playable_card(a)
	test_drain_card(a)
	a.summarize()

func test_configure_valid_level(a: Assert) -> void:
	var c = Capacitor.new()
	c.capacity = 1
	c.configure_levels(Card.Pool.ENGINE, 1)
	a.is_eq(c.levels[Card.Pool.ENGINE], 1, "Can increase level when capacity is available")

func test_configure_invalid_level(a: Assert) -> void:
	var c = Capacitor.new()
	c.configure_levels(Card.Pool.ENGINE, 1)
	a.is_eq(c.levels[Card.Pool.ENGINE], 0, "Can't increase level without available capacity")

func test_valid_playable_card(a: Assert) -> void:
	var c = Capacitor.new()
	c.levels[Card.Pool.ENGINE] = 1
	var card = Card.new()
	card.cost[Card.Pool.ENGINE] = 1
	a.is_true(c.is_playable(card), "Detect playable card")

func test_invalid_playable_card(a: Assert) -> void:
	var c = Capacitor.new()
	c.levels[Card.Pool.ENGINE] = 1
	c.levels[Card.Pool.SHIELD] = 1
	var card = Card.new()
	card.cost[Card.Pool.ENGINE] = 2
	card.cost[Card.Pool.SHIELD] = 1
	a.is_true(not c.is_playable(card), "Detect unplayable card")

func test_drain_card(a: Assert) -> void:
	var c = Capacitor.new()
	c.levels[Card.Pool.ENGINE] = 1
	c.levels[Card.Pool.WEAPON] = 1
	var card = Card.new()
	card.cost[Card.Pool.ENGINE] = 1
	card.cost[Card.Pool.WEAPON] = 1
	c.drain(card)
	a.is_eq([c.levels[Card.Pool.ENGINE], c.levels[Card.Pool.WEAPON]], [0, 0], "Capacitor drained by card")