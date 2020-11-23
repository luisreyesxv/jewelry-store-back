class UserSerializer < ActiveModel::Serializer
  attributes  :name, :email
  has_many :orders
  has_many :items, through: :orders
end
