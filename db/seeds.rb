# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 1件ずつ作成
# ループでまとめて作成
2.times do |i|
    Product.create(title: "ナイキ エア フォース 1 '07",description: "ナイキ エア フォース 1 '07は、人気のバスケットボールシューズのオリジナルモデルに新しいテイストを加えたデザイン。しっかりステッチされたオーバーレイ、クリーンな仕上げ、適度な光沢で、個性を際立たせます。",price: "11000",image: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/21d38052-598b-44f6-a857-123c9f72b015/%E3%83%8A%E3%82%A4%E3%82%AD-%E3%82%A8%E3%82%A2-%E3%83%95%E3%82%A9%E3%83%BC%E3%82%B9-1-07-%E3%83%A1%E3%83%B3%E3%82%BA%E3%82%B7%E3%83%A5%E3%83%BC%E3%82%BA-J16CJp.jpg")
    Product.create(title: "ナイキ デイブレイクタイプ",description: "ナイキ デイブレイクタイプは、初期のバウワーマンのプロトタイプをイメージし、伝統的なNikeのランニングシューズを復活させたアイテム。アッパーのフェルトやジャージーメッシュなど、重量の20％以上にリサイクル素材を使用した質感豊かなデザインで、レトロなスタイルに現代的なテイストをプラス。大きなヒールクリップ、露出したフォームのシュータン、ステッチされたスウッシュで、DIYの雰囲気を演出。Nike Grindワッフルアウトソールで、世界最高のアイコニックなスタイルをアレンジしました。",price: "12100",image: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/01078aeb-300c-4ca2-a3cc-388c7e2482aa/%E3%83%8A%E3%82%A4%E3%82%AD-%E3%83%87%E3%82%A4%E3%83%96%E3%83%AC%E3%82%A4%E3%82%AF%E3%82%BF%E3%82%A4%E3%83%97-%E3%83%A1%E3%83%B3%E3%82%BA%E3%82%B7%E3%83%A5%E3%83%BC%E3%82%BA-QPZFck.jpg")
    Product.create(title: "ナイキ エア マックス ゼファー",description: "快適な履き心地が最先端のイノベーションと融合して、新たな境地に到達。未来的なスタイルと履き心地のエア マックス ゼファーは、ビジブルAirの柔らかいクッショニングをアッパーに配するとともに、足下の通気性も確保しています。トラックをイメージした洗練されたシルエットに、耐久性に優れた縫い目のないスキンと風通しのよい肌触りのメッシュを使用して、現代的なスタイルを演出。パッド入りの快適な履き口により、足を踏み出すたびに開放感が得られます。",price: "11000",image: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/fc157b72-3f6d-4f81-bbac-3dc33b03572c/%E3%83%8A%E3%82%A4%E3%82%AD-%E3%82%A8%E3%82%A2-%E3%83%9E%E3%83%83%E3%82%AF%E3%82%B9-%E3%82%BC%E3%83%95%E3%82%A1%E3%83%BC-%E3%83%A1%E3%83%B3%E3%82%BA%E3%82%B7%E3%83%A5%E3%83%BC%E3%82%BA-5m53mf.jpg")
end