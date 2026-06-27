extends SceneTree

func _init() -> void:
	print("-".repeat(100))
	print_rich("[b][u]Testing Capacitor:[/b][/u]\n")
	TestCapacitor.run()
	print_rich("[b][u]Testing Ship:[/b][/u]\n")
	TestShip.run()
	print_rich("[b][u]Testing MovementAction:[/b][/u]\n")
	TestMovementAction.run()
	Assert.summarize_whole()
	quit()

# for sanity: print_rich("[b][u]Testing [/b][/u]\n")
