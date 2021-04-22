class UserSerializer < ActiveModel::Serializer
  attributes  :name, :email
  has_many :orders
  # has_many :item_materials, through: :orders
end
