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
				number: true
				
			"property[phone_country]":
				required: true
				minlength: 2
				maxlength: 4
				
			"property[phone_number]":
				required: true
				minlength: 6
				maxlength: 14
				
			"property[street]":
				required: "#postal.active"

			"property[city]":
				required: "#postal.active"

			"property[state]":
				required: "#postal.active"
				
			"property[zipcode]":
				required: "#postal.active"
				
			"property[latitude]":
				required: "#gps.active"
				range: [-180, 180]

			"property[longitude]":
				required: "#gps.active"
				range: [-180, 180]
		
		messages: 
			"property[title]": 
				required: "Please provide a title of the property"
				minlength: "The property title must be at least 6 characters long"
			
			"property[description]": 
				required: "Please provide a description of the property"
				
			"property[price]": 
				required: "Please provide a price per week of the property"
				number: "The price can be a whole number or a decimal"

			"property[phone_country]":
				required: "Please provide the country code of the phone number"

			"property[phone_number]":
				required: "Please provide the phone number"

			"property[street]":
				required: "Please provide the 1st line of the address"

			"property[city]":
				required: "Please provide the name of the city"

			"property[state]":
				required: "Please provide the name of the province, region or state"
				
			"property[zipcode]":
				required: "Please provide the postal or ZIP code"
				
			"property[latitude]":
				required: "Please provide the latitude gps coordinate"
				range: "Latitude must be in the range of -180 and 180"

			"property[longitude]":
				required: "Please provide the longitude gps coordinate"
				range: "Longitude must be in the range of -180 and 180"

