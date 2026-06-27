class_name CombinedMovementFrame
extends RefCounted

var combined_frame: Dictionary[Ship, MovementFrame] = {}

func push(ship: Ship, frame: MovementFrame) -> void:
	combined_frame[ship] = frame
