# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#order_postcode').jpostal({
    postcode : ['#order_postcode' ],
    address  : {
                  '#order_prefecture_code' : "%3",
            	  '#order_address_city' : "%4",
     		      '#order_address_street' : "%5%6",
      		    	'#order_address_building' : "%7"
                }
  })