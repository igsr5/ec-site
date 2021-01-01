$("body").on('click','.edit-link',function(){
  address_id=$(this).data('id');
  $address_edit=$("#address-edit-"+address_id);
  $address=$("#address-"+address_id);
  $('.address-data').show();
  $(".edit").hide();
  $address.hide();
  $address_edit.show();
})



$("body").on('click','.address-edit-back',function(){
  $('.address-data').show();
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
