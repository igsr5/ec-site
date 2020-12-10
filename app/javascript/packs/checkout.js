window.numberOnly=function (id) {
  var element = document.getElementById(id);
  var regex = /[^0-9]/gi;
  element.value = element.value.replace(regex, "");
}

window.numberAndHyphenOnly=function (id){
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