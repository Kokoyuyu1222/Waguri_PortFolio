# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: "Waguri.PortFolio@gmail.com",
             password:  "Waguri202002",
             password_confirmation: "Waguri202002")

Consumer.create!(email:"yk.rk1222@gmail.com",
                 password:  "Webcamp",
                 password_confirmation: "Webcamp",
                 last_name:"小西",
                 first_name:"一郎",
                 name:"小西一郎",
                 kana_first_name:"コニシ",
                 kana_last_name:"イチロウ",
                 phone:"09088880000",
                 gender:"man",
                 age:"ten",
                 withdraw:"draft",
                 postcode:"6496124",
                 prefecture_code: 30,
                 address_city:"紀の川市桃山町市場",
                 address_street:"222",
                 address_building:"201号室",
                 address:"和歌山県 紀の川市桃山町市場 222 201号室"
  )
Consumer.create!(email:"nagoyuto0109@gmail.com",
                 password:  "Wagayama",
                 password_confirmation: "Wagayama",
                 last_name:"高矢",
                 first_name:"次郎",
                 name:"高矢次郎",
                 kana_first_name:"タカヤ",
                 kana_last_name:"ジロウ",
                 phone:"08088880000",
                 gender:"woman",
                 age:"thirty",
                 withdraw:"draft",
                 postcode:"649748",
                 prefecture_code: 30,
                 address_city:"紀の川市桃山町市場",
                 address_street:"4444",
                 address_building:"308号室",
                 address:"和歌山県 紀の川市桃山町市場 444 308号室"
  )
Fermer.create!(email:"takoyaki.boys202002@gmail.com",
                 password:  "FermerTest",
                 password_confirmation: "FermerTest",
                 last_name:"紺野",
                 first_name:"三郎",
                 name:"紺野三郎",
                 kana_first_name:"コンノ",
                 kana_last_name:"サブロウ",
                 phone:"09000008888",
                 garden:"紺野ファームズ",
                 home_page:"https://***********",
                 withdraw:"draft",
                 postcode:"6496124",
                 prefecture_code:30,
                 address_city:"紀の川市桃山町市場",
                 address_street:"6666666",
                 address_building:"",
                 address:"和歌山県 紀の川市桃山町市場 6666666"
  )
Fermer.create!(email:"konishi.peach@gmail.com",
                 password:  "FermerTes2",
                 password_confirmation: "FermerTes2",
                 last_name:"細馬",
                 first_name:"四郎",
                 name:"細馬四郎",
                 kana_first_name:"ホソマ",
                 kana_last_name:"シロウ",
                 phone:"08000008888",
                 garden:"細馬農園",
                 home_page:"https://***********",
                 withdraw:"draft",
                 postcode:"6496124",
                 prefecture_code:30,
                 address_city:"紀の川市桃山町市場",
                 address_street:"555555",
                 address_building:"",
                 address:"和歌山県 紀の川市桃山町市場 555555"
  )



Category.create!(name: "みかん",category_status: "draft")
  Brand.create!(name:"早生みかん",brand_status:"draft",category_id: 1)
  Brand.create!(name:"温州みかん",brand_status:"draft",category_id: 1)

Category.create!(name: "もも",category_status: "draft")
  Brand.create!(name:"白鳳",brand_status:"draft",category_id: 2)
  Brand.create!(name:"川中島",brand_status:"draft",category_id: 2)

Category.create!(name: "いちご",category_status: "draft")
  Brand.create!(name:"まり姫",brand_status:"draft",category_id: 3)
  Brand.create!(name:"あまおう",brand_status:"draft",category_id: 3)

Category.create!(name: "りんご",category_status: "draft")
  Brand.create!(name:"ジョナゴールド",brand_status:"draft",category_id: 4)
  Brand.create!(name:"王林",brand_status:"draft",category_id: 4)

Category.create!(name: "マスカット",category_status: "draft")
  Brand.create!(name:"シャインマスカット",brand_status:"draft",category_id: 5)
  Brand.create!(name:"マスカット",brand_status:"draft",category_id: 5)

# Product.create!(name:"１kg 化粧箱",brand_id: 1,category_id: 2,fermer_id:1,
#                 sale_status:"sale",unit_price:"2000",stock_id:1,
#                 introduction:"もぎたて新鮮な桃です。ご注文を受けてから収穫、出荷いたします。")
#   Stock.create!(quantity:"100")
#   ProductImage.create!()
#   ProductComment.create!(comment:"配送も早く、とても新鮮でした。",
#                  consumer_id:1,priduct_id:1,title:"すごく良かったです",rate:5)
#   ProductComment.create!(comment:"対応がとても丁寧でした。",
#                  consumer_id:2,priduct_id:1,title:"丁寧な対応でした",rate:4)

#   Product.create!(name:"3kg 化粧箱",brand_id: 2,category_id: 2,fermer_id:1,
#                 sale_status:"sale",unit_price:"4500",stock_id:2,
#                 introduction:"もぎたて新鮮な桃です。ご注文を受けてから収穫、出荷いたします。")
#   Stock.create!(quantity:"100")
#   ProductImage.create!()
#   ProductComment.create!(comment:"配送も早く、とても新鮮でした。",
#                  consumer_id:1,priduct_id:1,title:"すごく良かったです",rate:5)
#   ProductComment.cretate!(comment:"配送も早く、とても新鮮でした。",
#                  consumer_id:2,priduct_id:1,title:"すごく良かったです",rate:5)

#   Product.create!(name:"2kg 化粧箱",brand_id: 1,category_id: 1,fermer_id:1,
#                 sale_status:"sale",unit_price:"500",stock_id:3,
#                 introduction:"もぎたて新鮮なみかんです。ご注文を受けてから収穫、出荷いたします。")
#   Stock.create!(quantity:"100")
#   ProductComment.create!(comment:"配送も早く、とても新鮮でした。",
#                  consumer_id:1,priduct_id:1,title:"すごく良かったです",rate:5)
#   ProductComment.create!(comment:"配送も早く、とても新鮮でした。",
#                  consumer_id:2,priduct_id:1,title:"すごく良かったです",rate:5)

#   Product.create!(name:"4kg 化粧箱",brand_id: 2,category_id: 1,fermer_id:1,
#                 sale_status:"sale",unit_price:"1000",stock_id:4,
#                 introduction:"もぎたて新鮮なみかんです。ご注文を受けてから収穫、出荷いたします。")
#   Stock.create!(quantity:"100")
#   ProductComment.create!(comment:"配送も早く、とても新鮮でした。",
#                  consumer_id:1,priduct_id:1,title:"すごく良かったです",rate:5)
#   ProductComment.create!(comment:"配送も早く、とても新鮮でした。",
#                  consumer_id:2,priduct_id:1,title:"すごく良かったです",rate:5)

#   Product.create!(name:"3kg 化粧箱",brand_id: 1,category_id: 3,fermer_id:2,
#                 sale_status:"sale",unit_price:"5000",stock_id:5,
#                 introduction:"もぎたて新鮮ないちごです。ご注文を受けてから収穫、出荷いたします。")
#   Stock.create!(quantity:"100")
#   ProductComment.create!(comment:"配送も早く、とても新鮮でした。",
#                  consumer_id:1,priduct_id:1,title:"すごく良かったです",rate:5)
#   ProductComment.create!(comment:"配送も早く、とても新鮮でした。",
#                  consumer_id:2,priduct_id:1,title:"すごく良かったです",rate:5)

#   Product.create!(name:"2kg 化粧箱",brand_id: 2,category_id: 3,fermer_id:2,
#                 sale_status:"sale",unit_price:"3000",stock_id:6,
#                 introduction:"もぎたて新鮮ないちごです。ご注文を受けてから収穫、出荷いたします。")
#   Stock.create!(quantity:"100")
#   ProductComment.create!(comment:"配送も早く、とても新鮮でした。",
#                  consumer_id:1,priduct_id:1,title:"すごく良かったです",rate:4)
#   ProductComment.create!(comment:"普通のいちごでした。",
#                  consumer_id:2,priduct_id:1,title:"良かったです",rate:3)

#   Product.create!(name:"１kg 化粧箱",brand_id: 1,category_id: 4,fermer_id:2,
#                 sale_status:"sale",unit_price:"2000",stock_id:7,
#                 introduction:"もぎたて新鮮なリンゴです。ご注文を受けてから収穫、出荷いたします。")
#   Stock.create!(quantity:"100")
#   ProductComment.create!(comment:"2000円は安い。",
#                  consumer_id:1,priduct_id:1,title:"すごく良かったです",rate:5)
#   ProductComment.create!(comment:"配送も早く、とても新鮮でした。",
#                  consumer_id:2,priduct_id:1,title:"すごく良かったです",rate:5)

#   Product.create!(name:"4kg 化粧箱",brand_id: 2,category_id: 4,fermer_id:2,
#                 sale_status:"sale",unit_price:"3000",stock_id:8,
#                 introduction:"もぎたて新鮮なリンゴです。ご注文を受けてから収穫、出荷いたします。")
#   Stock.create!(quantity:"100")
#   ProductComment.create!(comment:"少し高く感じました。",
#                  consumer_id:1,priduct_id:1,title:"高価",rate:2)
#   ProductComment.cretate!(comment:"贈り物にしたのですが、とても喜んでいただけました。",
#                  consumer_id:2,priduct_id:1,title:"贈り物にお薦めです",rate:5)

#   Product.create!(name:"１kg 化粧箱",brand_id: 1,category_id: 4,fermer_id:2,
#                 sale_status:"sale",unit_price:"2000",stock_id:7,
#                 introduction:"もぎたて新鮮なシャインマスコットです。ご注文を受けてから収穫、出荷いたします。")
#   Stock.create!(quantity:"100")
#   ProductComment.create!(comment:"2000円は安い。",
#                  consumer_id:1,priduct_id:1,title:"すごく良かったです",rate:5)
#   ProductComment.create!(comment:"配送も早く、とても新鮮でした。",
#                  consumer_id:2,priduct_id:1,title:"すごく良かったです",rate:5)

#   Product.create!(name:"4kg 化粧箱",brand_id: 2,category_id: 4,fermer_id:2,
#                 sale_status:"sale",unit_price:"8000",stock_id:8,
#                 introduction:"もぎたて新鮮なマスカットです。ご注文を受けてから収穫、出荷いたします。")
#   Stock.create!(quantity:"100")
#   ProductComment.create!(comment:"少し高く感じました。",
#                  consumer_id:1,priduct_id:1,title:"高価",rate:2)
#   ProductComment.create!(comment:"贈り物にしたのですが、とても喜んでいただけました。",
#                  consumer_id:2,priduct_id:1,title:"贈り物にお薦めです",rate:5)

# Column.create!(title:"桃の花の間引き作業",
#                body:"4月５日に桃の花間引きを行った。新木の作業ゆえに、慎重に将来の桃の枝の幹を計算し、間引き、剪定を行う",
#                feremer_id: 1 )

# Column.create!(title:"桃の消毒作業を行いました。",
#                body:"桃の病気などを予防するために消毒を行いました。",
#                feremer_id: 1 )

# Column.create!(title:"苺の出荷作業",
#                body:"苺の出荷作業を行いました。来月からは、いちご狩りも行います。",
#                feremer_id: 1 )

# Column.create!(title:"リンゴの木の選定作業",
#                body:"リンゴの木の選定作業を行いました。選定は木を大きくする上で必要なことです。",
#                feremer_id: 2 )

# Column.create!(title:"マスカットの出荷作業",
#                body:"4月５日に桃の花間引きを行った。新木の作業ゆえに、慎重に将来の桃の枝の幹を計算し、間引き、剪定を行う",
#                feremer_id: 2 )

# Column.create!(title:"桃の花の間引き作業",
#                body:"4月５日に桃の花間引きを行った。新木の作業ゆえに、慎重に将来の桃の枝の幹を計算し、間引き、剪定を行う",
#                feremer_id: 2 )


