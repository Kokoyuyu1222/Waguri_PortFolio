# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ 'turbolinks:load', ->
  $('#consumer_postcode').jpostal({
    postcode : ['#consumer_postcode' ],
    address  : {
                  '#consumer_prefecture_code' : "%3",
            	  '#consumer_address_city' : "%4",
     		      '#consumer_address_street' : "%5%6",
      		    	'#consumer_address_building' : "%7"
                }
  })