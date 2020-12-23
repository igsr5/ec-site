console.log("test");
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

var postal_code = document.getElementsByClassName("postal_code");
for(var i = 0; postal_code[i] != null; i++){
  postal_code[i].textContent="〒"+postal_code[i].textContent.slice(0,3)+"-"+postal_code[i].textContent.slice(3,7);
}


