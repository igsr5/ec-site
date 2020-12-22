$('[name="page[category]"]').change(function(){
  console.log("1");
  var radioval = $(this).val();
  if(radioval == "new"){
    $(".form-new").removeClass("d-none");
    $("input.form-control").attr('required',true)
    console.log("aa")
  }else{
    $(".form-new").addClass("d-none");
    $("input.form-control").attr('required',false)
    console.log("bb")
  }
})
