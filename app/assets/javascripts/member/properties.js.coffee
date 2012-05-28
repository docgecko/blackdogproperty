# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$(".new_property").validate 
		errorElement: "label"
		wrapper: "div class=\"error_message\" style=\"display: block;\""
		errorPlacement: (error, element) ->
			if element.attr("name") == "property[price]"
				error.insertBefore "fieldset#price"
			else if element.attr("name") == "property[phone_country]"
				error.insertBefore "fieldset#phone"
			else if element.attr("name") == "property[phone_number]"
				error.insertBefore "fieldset#phone"
			else
				error.insertBefore element
		
		rules: 
			"property[title]": 
				required: true
				minlength: 6

			"property[description]": 
				required: true

			"property[price]": 
				required: true
				
			"property[phone_country]":
				required: true
				
			"property[phone_number]":
				required: true
				
			"property[address_attributes][street]":
				required: true

			"property[address_attributes][city]":
				required: true

			"property[address_attributes][state]":
				required: true
				
			"property[address_attributes][zipcode]":
				required: true
		
		messages: 
			"property[title]": 
				required: "Please provide a title of the property"
				minlength: "The property title must be at least 6 characters long"
			
			"property[description]": 
				required: "Please provide a description of the property"
				
			"property[price]": 
				required: "Please provide a price per week of the property"

			"property[phone_country]":
				required: "Please provide the country code of the phone number"

			"property[phone_number]":
				required: "Please provide the phone number"

			"property[address_attributes][street]":
				required: "Please provide the 1st line of the address"

			"property[address_attributes][city]":
				required: "Please provide the name of the city"

			"property[address_attributes][state]":
				required: "Please provide the name of the province, region or state"
				
			"property[address_attributes][zipcode]":
				required: "Please provide the postal or ZIP code"
