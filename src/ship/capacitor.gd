class_name Capacitor
extends RefCounted

var levels: Array[int]

var locked: bool = false
var capacity: int = 0

var remaining_capacity: int:
	get:
		return levels.reduce(func(acc, n): return acc - n,capacity) 

func _init() -> void:
	levels.resize(Card.Pool.values().size())

func configure_levels(target: Card.Pool, delta: int) -> void:
	if (remaining_capacity >= delta and not locked and (levels[target] + delta >= 0)):
		levels[target] += delta

func toggle_lock() -> void:
	locked = not locked

func is_playable(card: Card) -> bool:
	return (
		levels[Card.Pool.ENGINE] >= card.cost[Card.Pool.ENGINE] and
		levels[Card.Pool.SHIELD] >= card.cost[Card.Pool.SHIELD] and
		levels[Card.Pool.WEAPON] >= card.cost[Card.Pool.WEAPON]
	)

func drain(card: Card) -> void:
	assert(is_playable(card), "Unplayable card.")
	for system in Card.Pool.values():
		levels[system] -= card.cost[system]