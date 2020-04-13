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

# Column.create!(title:"桃の花の間引き作業",
#                body:"4月５日に桃の花間引きを行った。新木の作業ゆえに、慎重に将来の桃の枝の幹を計算し、間引き、剪定を行う",
#                feremer_id: 1 )

