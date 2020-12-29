$("body").on('click','.edit-link',function(){
  address_id=$(this).data('id');
  console.log(address_id);
  $address_edit=$("#address-edit-"+address_id);
  $address=$("#address-"+address_id);
  $('.address-data').show();
  $(".edit").hide();
  $address.hide();
  $address_edit.show();
})

$(".address-edit-back").on('click',function(){
  $('.address-data').show();
  $('.edit').hide();
})
