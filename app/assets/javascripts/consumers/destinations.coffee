# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#destination_postcode').jpostal({
    postcode : ['#destination_postcode' ],
    address  : {
                  '#destination_prefecture_code' : "%3",
            	  '#destination_address_city' : "%4",
     		      '#destination_address_street' : "%5%6",
      		    	'#destination_address_building' : "%7"
                }
  })