extends SceneTree

func _init() -> void:
	print("-".repeat(100))
	print_rich("[b][u]Testing Capacitor:[/b][/u]\n")
	TestCapacitor.run()
	print_rich("[b][u]Testing Ship:[/b][/u]\n")
	TestShip.run()
	print_rich("[b][u]Testing MovementAction:[/b][/u]\n")
	TestMovementAction.run()
	print_rich("[b][u]Testing MovementTurn[/b][/u]\n")
	TestMovementTurn.run()
	print_rich("[b][u]Testing CombinedMovementFrame[/b][/u]\n")
	TestCombinedMovementFrame.run()
	Assert.summarize_all()
	quit()

# for sanity: print_rich("[b][u]Testing [/b][/u]\n")
