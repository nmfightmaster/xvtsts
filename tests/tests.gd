extends SceneTree

func _init() -> void:
	print("Testing Capacitor:")
	TestCapacitor.new().run()
	print("Testing Ship:")
	TestShip.new().run()
	quit()