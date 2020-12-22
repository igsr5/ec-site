$('[name="page[category]"]').change(function(){
  console.log("1");
  var radioval = $(this).val();
  if(radioval == "new"){
    console.log("aa")
  }else{
    console.log("bb")
  }
})
