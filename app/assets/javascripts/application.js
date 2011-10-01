// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .
//= require rails.validations

clientSideValidations.callbacks.element.fail = function(element, message, callback) {
  callback();
  if (element.data('valid') !== false) {
    element.parent().find('.message').hide().show('fade', 500);
  }
}

clientSideValidations.callbacks.element.pass = function(element, callback) {
  // Take note how we're passing the callback to the hide() 
  // method so it is run after the animation is complete.
  element.parent().find('.message').hide('fade', 500, callback);
}
