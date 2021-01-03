// 公開鍵を登録し、起点となるオブジェクトを取得します
var payjp = Payjp('pk_test_7cd915e1cc911268d5d3b9c7')

var elements4 = payjp.elements()

// 入力フォームを分解して管理・配置できます
var numberElement = elements4.create('cardNumber')
var expiryElement = elements4.create('cardExpiry')
var cvcElement = elements4.create('cardCvc')
numberElement.mount('#number-form')
expiryElement.mount('#expiry-form')
cvcElement.mount('#cvc-form')

// createTokenの引数には任意のElement1つを渡します
function onSubmit2(event) {
  payjp.createToken(numberElement).then(function(r) {
    document.querySelector('#token2').innerText = r.error ? r.error.message : r.id
  })
}
