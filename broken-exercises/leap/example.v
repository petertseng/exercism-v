module main

fn leap(year int) bool {
	// Doesn't work yet. https://github.com/vlang/v/issues/1066
	has_factor := fn (factor int) bool {
		return year % factor == 0
	}
	return has_factor(4) && (!has_factor(100) || has_factor(400))
}
