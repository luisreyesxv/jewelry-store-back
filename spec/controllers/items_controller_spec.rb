require 'rails_helper'
require 'faker'
describe "Item routes", :type => :request do
  
before do 
  30.times do 
    Item.create(name: Faker::Superhero.unique.name+ " "+ Faker::Cannabis.cannabinoid,
    price: Faker::Commerce.price,
    active:true,
    detail: Faker::Hipster.paragraph,
    description: Faker::Hipster.paragraph(sentence_count: [1..8].sample))
  end


  

end
it '/index is returning items' do
  get '/api/v1/items'
    expect(JSON.parse(response.body)["items"].size).to eq(10)
    expect(JSON.parse(response.body)["meta"]["total_pages"]).to eq(3)
  end
it '/index returns status code 200' do
  get '/api/v1/items'
    expect(response).to have_http_status(:success)
end

it '/show' do
  3.times do
    random_item = Item.all.sample

    get '/api/v1/items/'+ random_item.slug
    expect(JSON.parse(response.body)["slug"]).to eq(random_item[:slug])
    expect(BigDecimal(JSON.parse(response.body)["price"])).to eq(random_item[:price])
    expect(JSON.parse(response.body)["active"]).to eq(random_item[:active])
    expect(JSON.parse(response.body)["detail"]).to eq(random_item[:detail])
    expect(JSON.parse(response.body)["description"]).to eq(random_item[:description])
    expect(response).to have_http_status(:success)


  end


end

end