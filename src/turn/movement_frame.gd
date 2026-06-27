class_name MovementFrame
extends RefCounted

var frame: int
var position: int
var facing: Ship.Facing = Ship.Facing.POS

func _init(fr: int, p: int, fa: Ship.Facing) -> void:
	frame = fr
	position = p
	facing = fa
