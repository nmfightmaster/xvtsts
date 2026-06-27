class_name MovementTurn
extends RefCounted

var movement_turn: Dictionary[Ship, Array]

func append(ship: Ship, actions: Array[MovementAction]) -> void:
	assert(movement_turn.has(ship), "Invalid ship.")
	movement_turn[ship].append_array(actions)	

func clear(ship: Ship) -> void:
	assert(movement_turn.has(ship), "Invalid ship.")
	movement_turn[ship].clear()

func get_actions(ship: Ship) -> Array[MovementAction]:
	var typed: Array[MovementAction] = []
	typed.assign(movement_turn[ship])
	return typed

func get_ships() -> Array[Ship]:
	var typed: Array[Ship] = []
	typed.assign(movement_turn.keys())
	return typed

func _init(ships: Array[Ship]) -> void:
	for ship in ships:
		movement_turn[ship] = []
