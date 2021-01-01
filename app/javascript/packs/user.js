$("body").on('click','.edit-link',function(){
  id = $(this).data('id');
  type = $(this).data('type');
  $edit=$("#"+type+"-edit-"+id);
  $type=$("#"+type+"-"+id);
  $('.'+type+'-data').show();
  $(".edit").hide();
  $type.hide();
  $edit.show();
})



$("body").on('click','.address-edit-back',function(){
  $('.address-data').show();
  $('.edit').hide();
})

$("body").on('click','.card-edit-back',function(){
  $('.card-data').show();
  $('.edit').hide();
})


$('body').on('click','.new-link',function(){
  $(this).hide();
  id = $(this).attr('id');
  if(id === 'new-link-address'){
    $('#new-address').show();
  }
})

$('.address-new-back').on('click',function(){
  $('#new-address').hide();
  $('#new-link-address').show();
})
