// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

clear_ingredients = function() {
  $('[id^="order_ingredients"]').attr('checked', false);
}

hide_ingredients = function() {
  $('[id^="ingredient-list"]').hide();
}

show_ingredients_handler = function(kind_id) {
  return function() {
    clear_ingredients()
    hide_ingredients()
    $('#ingredients-label').show()
    $('#'+kind_id).show()
  }
}

$(function() {
  $('#order_ordertype_meaty').click(show_ingredients_handler('ingredient-list-meaty')) 
  $('#order_ordertype_veggie').click(show_ingredients_handler('ingredient-list-veggie')) 
  $('#order_ordertype_vegan').click(show_ingredients_handler('ingredient-list-vegan'))
})
