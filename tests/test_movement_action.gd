class_name TestMovementAction
extends RefCounted

func run() -> void:
	var a = Assert.new()
	test_default_move(a)
	test_move(a)
	test_turn(a)
	a.summarize()

func test_default_move(a: Assert) -> void:
	var m = MovementAction.create_move()
	a.is_true(m.distance == 1 and m.type == MovementAction.Type.MOVE, "Default MOVE created with distance 1")
	
func test_move(a: Assert) -> void:
	var m = MovementAction.create_move(2)
	a.is_true(m.distance == 2 and m.type == MovementAction.Type.MOVE, "MOVE created with specified distance")

func test_turn(a: Assert) -> void:
	var m = MovementAction.create_turn()
	a.is_true(m.type == MovementAction.Type.TURN and m.distance == 0,"TURN created")
