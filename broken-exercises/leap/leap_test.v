module main

fn test_year_not_divisible_by_4_in_common_year() {
	assert !leap(2015)
}

fn test_year_divisible_by_2_not_divisible_by_4_in_common_year() {
	assert !leap(1970)
}

fn test_year_divisible_by_4_not_divisible_by_100_in_leap_year() {
	assert leap(1996)
}

fn test_year_divisible_by_4_and_5_is_still_a_leap_year() {
	assert leap(1960)
}

fn test_year_divisible_by_100_not_divisible_by_400_in_common_year() {
	assert !leap(2100)
}

fn test_year_divisible_by_100_but_not_by_3_is_still_not_a_leap_year() {
	assert !leap(1900)
}

fn test_year_divisible_by_400_is_leap_year() {
	assert leap(2000)
}

fn test_year_divisible_by_400_but_not_by_125_is_still_a_leap_year() {
	assert leap(2400)
}

fn test_year_divisible_by_200_not_divisible_by_400_in_common_year() {
	assert !leap(1800)
}
