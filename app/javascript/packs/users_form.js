$('[name="page[category]"]').change(function(){
  console.log("1");
  var radioval = $(this).val();
  if(radioval == "new"){
    $(".form-new").removeClass("d-none");
    console.log("aa")
  }else{
    $(".form-new").addClass("d-none");
    console.log("bb")
  }
})
