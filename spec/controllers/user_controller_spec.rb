require 'rails_helper'
require 'faker'
describe "User routes", :type => :request do
  
before {get '/api/v1/users'}
it 'returns all questions' do
   puts User.count
    expect(JSON.parse(response.body).size).to eq(20)
  end
it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end