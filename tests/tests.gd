extends SceneTree

func _init() -> void:
	print("-".repeat(100))
	print_rich("[b][u]Testing Capacitor:[/b][/u]\n")
	TestCapacitor.new().run()
	print_rich("[b][u]Testing Ship:[/b][/u]\n")
	TestShip.new().run()
	quit()

# for sanity: print_rich("[b][u]Testing [/b][/u]\n")