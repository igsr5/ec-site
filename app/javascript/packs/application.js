/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//= require jquery3
//= require popper
//= require bootstrap-sprockets

import './styles/main'

function numberOnly(id) {
  var element = document.getElementById(id);
  var regex = /[^0-9]/gi;
  element.value = element.value.replace(regex, "");
}

function numberAndHyphenOnly(id){
  var element = document.getElementById(id);
  char_length=element.value.length;
  if (char_length == 2 && !element.value.match("/")){
      element.value+="/"
  }
  var regex = /[^0-9\/]/gi;
  element.value = element.value.replace(regex, "");
}

var postal_code = document.getElementById("postal_code");
postal_code.textContent="〒"+postal_code.textContent.slice(0,3)+"-"+postal_code.textContent.slice(3,7)
