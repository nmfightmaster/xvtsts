class_name Assert

static var single_passes: int = 0
static var single_failures: int = 0
static var all_passes: int = 0
static var all_failures: int = 0
static var results: Array[Dictionary] = []

static func is_true(condition: bool, description: String) -> void:
	if (condition):
		print_rich("- %s -- [color=green]PASS[/color]" % description)
		single_passes += 1
	else:
		print_rich("- %s -- [color=red]FAIL[/color]" % description)
		single_failures += 1

static func is_eq(actual: Variant, expected: Variant, description: String) -> void:
	if (actual == expected):
		print_rich("- %s -- [color=green]PASS[/color]" % description)
		single_passes += 1
	else:
		print_rich("- %s -- [color=red]FAIL[/color] -- expected: %s, got: %s" % [description, expected, actual])
		single_failures += 1

static func summarize_single(label: String) -> void:
	print()
	print_rich("Total %s tests passed: [color=green]%s[/color] \nTotal failed: [color=red]%s[/color]" % [label, single_passes, single_failures])
	print("-".repeat(100))
	results.append({"label": label, "passes": single_passes, "failures": single_failures})
	all_passes += single_passes
	all_failures += single_failures
	single_passes = 0
	single_failures = 0

static func summarize_all() -> void:
	print_rich("[b][color=purple]TEST SUMMARY:[/b][/color]\n")
	print_rich("Total passed: [color=green]%s[/color] \nTotal failed: [color=red]%s[/color]" % [all_passes, all_failures])
	var failed_tests: String = "|"
	for test in results:
		if test["failures"] > 0:
			failed_tests += " %s |" % test["label"]
	if failed_tests != "|":
		print_rich("Failed tests: [color=red]%s[/color]" % failed_tests)
	print("-".repeat(100))
	all_passes = 0
	all_failures = 0
	results = []
	