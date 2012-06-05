# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# New Member Property Validation
$.validator.addMethod "titleRegex", (value, element, param) ->
  value.match new RegExp("^" + param + "$")

ALPHA_REGEX = "[A-Za-z ]+"

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
				titleRegex: ALPHA_REGEX

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
				titleRegex: "Only be letters and spaces allowed for the property title"
			
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


# Edit Member Property Details
$(document).ready ->
	if $('input[id=property_sea_views]').attr("checked")
		$('input[id=property_sea_views]').after('<span id="property_sea_views_yes" class="yes">(yes)</span>')
	if $('input[id=property_conventions]').attr("checked")
		$('input[id=property_conventions]').after('<span id="property_conventions_yes" class="yes">(yes)</span>')
			
$(document).ready ->
	$('input[id=property_sea_views]').change ->
		if $(this).attr("checked")
			$(this).after('<span id="property_sea_views_yes" class="yes">(yes)</span>')
		else
			$('span[id=property_sea_views_yes]').remove();

$(document).ready ->
	$('input[id=property_conventions]').change ->
		if $(this).attr("checked")
			$(this).after('<span id="property_conventions_yes" class="yes">(yes)</span>')
		else
			$('span[id=property_conventions_yes]').remove();


# Edit Member Property Description Word Count
$(document).ready ->
  options = originalStyle: "originalDisplayInfo"
  $(".word_count").textareaCount options


# Edit Member Property Private & Public Address & Map
# Prepare document when ready()
$(document).ready ->
	$('a[id=cancel_edit_property_address]').hide()
	$('div[id=edit_property_location]').hide()
	$('a[id=edit_property_address]').show()
	$('div.map_view#private_map').show()

	# React to edit link clicks
	$('a[id=edit_property_address]').click ->
		$('a[id=edit_property_address]').hide()
		$('a[id=cancel_edit_property_address]').show()
		$('div[id=edit_property_location]').show()
		$('div.gmaps4rails_map#private_map').hide()

	# React to cancel link click
	$('a[id=cancel_edit_property_address]').click ->
		$('a[id=cancel_edit_property_address]').hide()
		$('a[id=edit_property_address]').show()
		$('div[id=edit_property_location]').hide()
		$('div.gmaps4rails_map#private_map').show()
