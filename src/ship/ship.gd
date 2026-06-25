class_name Ship
extends RefCounted

var health: int
var position: int
var facing: int = 1:
	set(value):
		assert(value == 1 or value == -1)
		facing = value

func move(distance: int) -> void:
	position += facing * distance

func turn() -> void:
	facing *= -1

func take_damage(amount: int) -> void:
	health = max(0, health - amount)

func can_hit(target: Ship) -> bool:
	return sign(target.position - position) == facing

func _init(h: int, p: int = 0, f: int = 1) -> void:
	health = h
	position = p
	facing = f
