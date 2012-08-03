# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$(".new_subscription").validate 
		errorElement: "label"
		wrapper: "div class=\"error_message\" style=\"display: block;\""
		errorPlacement: (error, element) ->
			error.insertBefore element

		rules: 
			"subscription[first_name]": 
				required: true

			"subscription[last_name]": 
				required: true

			"subscription[card_number]": 
				required: true

			"subscription[card_verification]": 
				required: true
				
		messages: 
			"subscription[first_name]": 
				required: "Please provide your first name"

			"subscription[last_name]": 
				required: "Please provide your last name"

			"subscription[card_number]": 
				required: "Please provide a credit card number"

			"subscription[card_verification]": 
				required: "Please provide the credit card verification number"