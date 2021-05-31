# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "Admin@a",
    password: "aaaaaa"
)

Genre.create(name: "ケーキ")
Genre.create(name: "クッキー")
Genre.create(name: "チョコレート")
    
Item.create!(
    genre_id: "1", 
    name: "ショートケーキ", 
    price_without_tax: "500", 
    introduction: "イチゴのショートケーキです", 
    )
Item.create!(
    genre_id: "2", 
    name: "チャンククッキー", 
    price_without_tax: "300", 
    introduction: "チョコ入りクッキー", 
    )
Item.create!(
    genre_id: "3", 
    name: "カカオ", 
    price_without_tax: "400", 
    introduction: "カカオ豆", 
    )