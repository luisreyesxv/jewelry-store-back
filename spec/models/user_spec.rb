require 'rails_helper'
require 'faker'


describe "User Model", :type => :model do


it 'creates a new user account with unique email, password between 6-20 characters' do
    new_user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(min_length: 10, max_length: 20) )
    expect(new_user).to be_valid
  end
# it 'will cause an error when a user is created without an email' do
#     expect(response).to have_http_status(:success)
# end
it 'will cause an error when a user is created with a duplicate email' do
    new_user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(min_length: 10, max_length: 20) )
    duplicate_user =  User.create(name: Faker::Name.name, email: new_user.email, password: Faker::Internet.password(min_length: 10, max_length: 20) )
    expect(duplicate_user).to_not be_valid
    expect(duplicate_user.errors[:email]).to eq(["has already been taken"])
    
end

it 'will create a user if a name is not applied' do
    new_user = User.create( email: Faker::Internet.email, password: Faker::Internet.password(min_length: 10, max_length: 20) )
    expect(new_user).to be_valid
end

it 'will cause an error if the password\'s length is not between 6-20 characters in length' do
    too_short = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(min_length: 2, max_length:5) )
    too_long = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(min_length: 21, max_length: 30 ))
    expect(too_short).to_not be_valid
    expect(too_long).to_not be_valid
    expect(too_short.errors[:password]).to eq(["is too short (minimum is 6 characters)"])
    expect(too_long.errors[:password]).to eq(["is too long (maximum is 20 characters)"])
end
end