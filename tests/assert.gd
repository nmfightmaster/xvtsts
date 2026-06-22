class_name Assert
extends RefCounted

var passes: int = 0
var failures: int = 0

func is_true(condition: bool, description: String) -> void:
	if (condition):
		print("%s -- PASS" % description)
		passes += 1
	else:
		print("%s -- FAIL" % description)
		failures += 1
	

func is_eq(actual: Variant, expected: Variant, description: String) -> void:
	if (actual == expected):
		print("%s -- PASS" % description)
		passes += 1
	else:
		print("%s -- FAIL -- expected: %s, got: %s" % [description, expected, actual])
		failures += 1

func summarize() -> void:
	print("Total passed: %s \nTotal failed: %s" % [passes, failures])