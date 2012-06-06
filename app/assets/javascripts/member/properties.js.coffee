# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# New Member Property Validation
$.validator.addMethod "titleRegex", (value, element, param) ->
  value.match new RegExp("^" + param + "$")

ALPHA_REGEX = "[A-Za-z ]+"

$(document).ready ->
	$(".new_property, .edit_property").validate 
		errorElement: "label"
		wrapper: "div class=\"error_message\" style=\"display: block;\""
		errorPlacement: (error, element) ->
			if element.attr("name") == "property[price_rental]"
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

			"property[price_rental]": 
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
				required: true

			"property[city]":
				required: true

			"property[state]":
				required: true
				
			"property[zipcode]":
				required: true
				
		messages: 
			"property[title]": 
				required: "Please provide a title of the property"
				minlength: "The property title must be at least 6 characters long"
				titleRegex: "Only be letters and spaces allowed for the property title"
			
			"property[description]": 
				required: "Please provide a description of the property"
				
			"property[price_rental]": 
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


$(document).ready ->
	$(".edit_user").validate 
		errorElement: "label"
		wrapper: "div class=\"error_message\" style=\"display: block;\""
		errorPlacement: (error, element) ->
			error.insertBefore element

		rules: 
			"user[first_name]": 
				required: true

			"user[last_name]": 
				required: true

			"user[email]": 
				required: true
				email: true
				remote: "/account/check_email"
				
		messages: 
			"user[email]": 
				required: "Please provide your email address"
				email: "Please enter a valid email address"
				remote: "This email address is already in use"
			
			"user[first_name]":
				required: "Please provide your first name"

			"user[last_name]":
				required: "Please provide your last name"
												

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


# Delete Member Property
# Prepare document when ready()
$(document).ready ->
	$('div[id=delete_possible]').show()
	$('div[id=delete_full]').hide()
	$('input[id=delete_property_button]').prop('disabled', true)
	
	# React to delete possible click
	$('a[id=delete_property_step1]').click ->
		$('div[id=delete_possible]').hide()
		$('div[id=delete_full]').show()

	# Agree to understand delete
	$('input[id=delete_agree]').change ->
		if $('input[id=delete_agree]').is(':checked')
			$('input[id=delete_property_button]').prop('disabled', false)
		else
			$('input[id=delete_property_button]').prop('disabled', true)
	