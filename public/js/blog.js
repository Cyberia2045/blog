$("#body").keyup(function() {
	var max = 140
	var length = $(this).val().length

	if (length >= max) {
		$(".char_remain").text("You have reached the character limit!")
	}
	else {
		var character = max - length
		$(".char_remain").text(character + "characters left")
	}
})