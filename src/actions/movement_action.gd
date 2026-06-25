class_name MovementAction
extends RefCounted

enum Type {MOVE, TURN}

var type: Type
var distance: int

func _init(t: Type, d: int = 0) -> void:
	assert(not (t == Type.TURN and d != 0), "Only MOVE actions can have a distance.")
	type = t
	distance = d

static func move(d: int) -> MovementAction:
	return MovementAction.new(Type.MOVE, d)

static func turn() -> MovementAction:
	return MovementAction.new(Type.TURN)