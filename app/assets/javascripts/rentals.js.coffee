# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Navigation css width
jQuery ->
	f = $('#filter').width()
	$('#description h1.underline').width(980 - f - 8 - 15 - 7)