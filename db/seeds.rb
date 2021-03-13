# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Order.destroy_all
Image.destroy_all
ItemMaterial.destroy_all
ItemCategory.destroy_all
User.destroy_all
Item.destroy_all
Category.destroy_all
Material.destroy_all


u1 = User.create(name: "Luis Reyes",email: "testing@email.com",password:"fakefakefake")
# item1 = Item.create(name: "Diamond Engagement Ring 3/4 ct tw Round-cut 14K White Gold",price: 1274.25,active:true,detail: Faker::Hipster.paragraph,description:"For an everlasting love, never-ending sparkle. Awash in round diamonds, this extraordinary engagement ring is crafted of 14K white gold. The ring has a total diamond weight of 3/4 carat.")

# order1= Order.create(purchased_price: 200.05, delivery: "Normal", status: "pending",order_date: DateTime.now(),street: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, country: "USA", zip: Faker::Address.zip, item:item1,user:u1)
silver = Material.create(name: "silver")
platinum = Material.create(name:"platinum")
gold = Material.create(name: "gold")

necklace = Category.create(name: "necklace")
ring = Category.create(name: "ring")
grill = Category.create(name:  "grill")
earring = Category.create(name: "earrings")
chain = Category.create(name: "chain")



def createItem (item: , materials:, categories:, images:)

    newItem= Item.create(item)
    puts "new Item created"

    categories.each{|category| ItemCategory.create(item: newItem,category: category)}
    puts "categories added"
    materials.each{|material| ItemMaterial.create(item: newItem,material: material)}
    puts "materials added"
    images.each{|image| Image.create(item_material: newItem.item_materials.all.sample,image_url: image)}
    puts "images added"

end

item1= {name: "Diamond Engagement Ring 3/4 ct tw Round-cut 14K White Gold",
        price: Faker::Commerce.price,
        active:true,
        detail: Faker::Hipster.paragraph,
        description:"For an everlasting love, never-ending sparkle. Awash in round diamonds, this extraordinary engagement ring is crafted of 14K white gold. The ring has a total diamond weight of 3/4 carat."
}
ringImg1= "https://res.cloudinary.com/dpojhdtrn/image/upload/v1606160778/gold%20ring%201.png"
createItem(item: item1, materials: [gold,silver], categories: [ring], images: [ringImg1,"https://i.pinimg.com/originals/cf/e9/3a/cfe93a55232f27627a66a2a367fe1c4c.gif"])


def randomItem(digit)
newItem= Item.create(name: Faker::Appliance.brand + " "+ Faker::Cannabis.cannabinoid + digit.to_s ,
price: Faker::Commerce.price,
active:true,
detail: Faker::Hipster.paragraph,
description: Faker::Hipster.paragraph(sentence_count: [1..8].sample))
    puts "new Item created"

    ItemCategory.create(item: newItem,category: Category.all.sample)
    puts "categories added"
   newItemMaterial = ItemMaterial.create(item: newItem, material: Material.all.sample)
    puts "materials added"
    Image.create(item_material: newItemMaterial, image_url: "https://res.cloudinary.com/dpojhdtrn/image/upload/v1606160778/gold%20ring%201.png")
    puts "images added"

    puts "Random Item added #{digit}"
end

(1..30).each{|number| randomItem(number)}