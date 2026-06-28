class_name TestCapacitor

static func run() -> void:
	test_remaining_capacity()
	test_toggle_locked_true()
	test_toggle_locked_false()
	test_locked_prevents_level_configuration()
	test_configure_valid_level_increase()
	test_configure_invalid_level_increase()
	test_configure_valid_level_decrease()
	test_configure_invalid_level_decrease()
	test_valid_playable_card()
	test_invalid_playable_card()
	test_drain_partial()
	test_drain_full()
	Assert.summarize_single("Capacitor")

static func test_remaining_capacity() -> void:
	var c: Capacitor = Capacitor.new()
	c.capacity = 2
	c.configure_levels(Card.Pool.ENGINE, 1)
	Assert.is_eq(c.remaining_capacity, 1, "Remaining capacity updates properly after configuration")

static func test_toggle_locked_true() -> void:
	var c: Capacitor = Capacitor.new()
	c.toggle_lock()
	Assert.is_true(c.locked, "Can toggle locked status to true")

static func test_toggle_locked_false() -> void:
	var c: Capacitor = Capacitor.new(1, true)
	c.toggle_lock()
	Assert.is_true(not c.locked, "Can toggle locked status to false")

static func test_locked_prevents_level_configuration() -> void:
	var c: Capacitor = Capacitor.new(1, true)
	c.configure_levels(Card.Pool.ENGINE, 1)
	Assert.is_eq(c.levels[Card.Pool.ENGINE], 0, "Can't increase level when locked, even when capacity is available")

static func test_configure_valid_level_increase() -> void:
	var c: Capacitor = Capacitor.new()
	c.capacity = 1
	c.configure_levels(Card.Pool.ENGINE, 1)
	Assert.is_eq(c.levels[Card.Pool.ENGINE], 1, "Can increase level when capacity is available")

static func test_configure_invalid_level_increase() -> void:
	var c: Capacitor = Capacitor.new()
	c.configure_levels(Card.Pool.ENGINE, 1)
	Assert.is_eq(c.levels[Card.Pool.ENGINE], 0, "Can't increase level without available capacity")

static func test_configure_valid_level_decrease() -> void:
	var c: Capacitor = Capacitor.new()
	c.capacity = 1
	c.configure_levels(Card.Pool.ENGINE, 1)
	c.configure_levels(Card.Pool.ENGINE, -1)
	Assert.is_eq(c.levels[Card.Pool.ENGINE], 0, "Can decrease level when above 0")

static func test_configure_invalid_level_decrease() -> void:
	var c: Capacitor = Capacitor.new()
	c.configure_levels(Card.Pool.ENGINE, -1)
	Assert.is_eq(c.levels[Card.Pool.ENGINE], 0, "Can't decrease level below 0")

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

static func test_drain_partial() -> void:
	var c: Capacitor = Capacitor.new()
	c.levels[Card.Pool.ENGINE] = 2
	c.levels[Card.Pool.WEAPON] = 2
	var card: Card = Card.new()
	card.cost[Card.Pool.ENGINE] = 1
	card.cost[Card.Pool.WEAPON] = 1
	c.drain(card)
	Assert.is_eq([c.levels[Card.Pool.ENGINE], c.levels[Card.Pool.WEAPON]], [1, 1], "Capacitor partially drained by card")

static func test_drain_full() -> void:
	var c: Capacitor = Capacitor.new()
	c.levels[Card.Pool.ENGINE] = 1
	c.levels[Card.Pool.WEAPON] = 1
	var card: Card = Card.new()
	card.cost[Card.Pool.ENGINE] = 1
	card.cost[Card.Pool.WEAPON] = 1
	c.drain(card)
	Assert.is_eq([c.levels[Card.Pool.ENGINE], c.levels[Card.Pool.WEAPON]], [0, 0], "Capacitor fully drained by card")