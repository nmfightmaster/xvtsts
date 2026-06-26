class_name Assert

static var passes: int = 0
static var failures: int = 0

static func is_true(condition: bool, description: String) -> void:
	if (condition):
		print_rich("- %s -- [color=green]PASS[/color]" % description)
		passes += 1
	else:
		print_rich("- %s -- [color=red]FAIL[/color]" % description)
		failures += 1

static func is_eq(actual: Variant, expected: Variant, description: String) -> void:
	if (actual == expected):
		print_rich("- %s -- [color=green]PASS[/color]" % description)
		passes += 1
	else:
		print_rich("- %s -- [color=red]FAIL[/color] -- expected: %s, got: %s" % [description, expected, actual])
		failures += 1

static func summarize() -> void:
	print()
	print_rich("Total passed: [color=green]%s[/color] \nTotal failed: [color=red]%s[/color]" % [passes, failures])
	print("-".repeat(100))
	passes = 0
	failures = 0
