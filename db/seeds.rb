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


orange = Category.create(:name => "みかん")


orange_red = orange.children.create(:name=>"ブラッドオレンジ")
orange_quick = orange.children.create(:name=>"早生みかん")

orange_reds.children.create([{:name=>"1Kg箱"},{:name=>"2Kg箱"},{:name=>"3Kg箱"}])
orange_quick.children.create([{:name=>"1Kg箱"},{:name=>"2Kg箱"},{:name=>"3Kg箱"}])