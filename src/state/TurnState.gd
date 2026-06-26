class_name TurnState
extends RefCounted

var state: Dictionary[Ship, Array]

func append(ship: Ship, actions: Array[MovementAction]) -> void:
	assert(state.has(ship), "Invalid ship.")
	state[ship].append_array(actions)	

func clear(ship: Ship) -> void:
	assert(state.has(ship), "Invalid ship.")
	state[ship].clear()

func get_actions(ship: Ship) -> Array[MovementAction]:
	var typed: Array[MovementAction] = []
	typed.assign(state[ship])
	return typed

func get_ships() -> Array[Ship]:
	var typed: Array[Ship] = []
	typed.assign(state.keys())
	return typed

func _init(ships: Array[Ship]) -> void:
	for ship in ships:
		state[ship] = []
