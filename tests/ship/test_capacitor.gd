class_name TestCapacitor

static func run() -> void:
	test_configure_valid_level()
	test_configure_invalid_level()
	test_valid_playable_card()
	test_invalid_playable_card()
	test_drain_card()
	Assert.summarize()

static func test_configure_valid_level() -> void:
	var c: Capacitor = Capacitor.new()
	c.capacity = 1
	c.configure_levels(Card.Pool.ENGINE, 1)
	Assert.is_eq(c.levels[Card.Pool.ENGINE], 1, "Can increase level when capacity is available")

static func test_configure_invalid_level() -> void:
	var c: Capacitor = Capacitor.new()
	c.configure_levels(Card.Pool.ENGINE, 1)
	Assert.is_eq(c.levels[Card.Pool.ENGINE], 0, "Can't increase level without available capacity")

static func test_valid_playable_card() -> void:
	var c: Capacitor = Capacitor.new()
	c.levels[Card.Pool.ENGINE] = 1
	var card: Card = Card.new()
	card.cost[Card.Pool.ENGINE] = 1
	Assert.is_true(c.is_playable(card), "Detect playable card")

static func test_invalid_playable_card() -> void:
	var c: Capacitor = Capacitor.new()
	c.levels[Card.Pool.ENGINE] = 1
	c.levels[Card.Pool.SHIELD] = 1
	var card: Card = Card.new()
	card.cost[Card.Pool.ENGINE] = 2
	card.cost[Card.Pool.SHIELD] = 1
	Assert.is_true(not c.is_playable(card), "Detect unplayable card")

static func test_drain_card() -> void:
	var c: Capacitor = Capacitor.new()
	c.levels[Card.Pool.ENGINE] = 1
	c.levels[Card.Pool.WEAPON] = 1
	var card: Card = Card.new()
	card.cost[Card.Pool.ENGINE] = 1
	card.cost[Card.Pool.WEAPON] = 1
	c.drain(card)
	Assert.is_eq([c.levels[Card.Pool.ENGINE], c.levels[Card.Pool.WEAPON]], [0, 0], "Capacitor drained by card")
