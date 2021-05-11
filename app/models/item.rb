class Item < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_by_name, 
    against: :name, 
    using: {
        tsearch: {prefix: true}
    }
   

        has_many :orders
        has_many :item_materials
        has_many :materials, through: :item_materials
        has_many :images, through: :item_materials
        has_many :item_categories
        has_many :categories, through: :item_categories


        validates :slug,:name, uniqueness: true
        validates :name, presence: true;

        after_create :update_slug
        before_update :assign_slug


        def update_slug
            assign_slug
            self.save
        end

        def create_slug
            return self.name.parameterize
        end


        def self.showcase_items
            return Item.includes(:item_materials,:materials, :item_categories, :categories, :images).all.sample(10)
            # return Item.all.sample(10)
        end



    private
        

        def assign_slug
            self.slug = create_slug
        end
end
