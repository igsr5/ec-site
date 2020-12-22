$('[name="page[category]"]').change(function(){
  console.log("1");
  var radioval = $(this).val();
  if(radioval == 1){
    console.log("aa")
  }else{
    console.log("bb")
  }
})
