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
  type = $(this).data('type');
  $(this).hide();
  $('#new-'+type).show();
})

$('.new-back').on('click',function(){
  type = $(this).data('type');
  $('#new-'+type).hide();
  $('#new-link-'+type).show();
})
