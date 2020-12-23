var start_radioval = $('[name="page[category]"]:checked').val();
if (start_radioval == "new"){
  $(".form-new").removeClass("d-none");
  $("input.required").attr('required',true)
}

$('[name="page[category]"]').change(function(){
  var radioval = $(this).val();
  if(radioval == "new"){
    $(".form-new").removeClass("d-none");
    $("input.required").attr('required',true)
  }else{
    $(".form-new").addClass("d-none");
    $("input.required").attr('required',false)
  }
})
