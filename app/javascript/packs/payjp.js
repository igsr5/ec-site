// 公開鍵を登録し、起点となるオブジェクトを取得します
var payjp = Payjp('pk_test_7cd915e1cc911268d5d3b9c7');
var $form = $('.payjp-form');

var elements4 = payjp.elements();

// 入力フォームを分解して管理・配置できます
var numberElement = elements4.create('cardNumber');
var expiryElement = elements4.create('cardExpiry');
var cvcElement = elements4.create('cardCvc');
numberElement.mount('#number-form');
expiryElement.mount('#expiry-form');
cvcElement.mount('#cvc-form');

$('#number-form').addClass('form-control').addClass('payjp-input');
$('#expiry-form').addClass('form-control').addClass('payjp-input');
$('#cvc-form').addClass('form-control').addClass('payjp-input');


// createTokenの引数には任意のElement1つを渡します
$form.on("click","input[type=submit]",function(e){
  isNew = $('#new').is(':checked');
  console.log(isNew)
  if (isNew){
    $form.find("input[type=submit]").prop("disabled", true);
    payjp.createToken(numberElement).then(function(r) {
      if (r.error){
        $('.form-error').text(r.error.message);
        $form.find("input[type=submit]").prop("disabled", false);
      }else{
        $form.append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(r.id));
        $form.get(0).submit();
      }
    })
  }
})

