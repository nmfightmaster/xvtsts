class_name Ship
extends RefCounted

var health: int
var position: int

enum Facing {POS = 1, NEG = -1}
var facing: Facing = Facing.POS:
	set(value):
		assert(value == Facing.POS or value == Facing.NEG)
		facing = value

func move(distance: int) -> void:
	position += facing * distance

func turn() -> void:
	facing = Facing.NEG if facing == Facing.POS else Facing.POS

func take_damage(amount: int) -> void:
	health = max(0, health - amount)

func can_hit(target: Ship) -> bool:
	return (target.position - position) * facing > 0

func _init(h: int, p: int = 0, f: Facing = Facing.POS) -> void:
	assert (health > 0, "Starting health must be positive.")
	health = h
	position = p
	facing = f
