class Item < ApplicationRecord
        has_many :orders
        has_many :images
        has_many :item_materials
        has_many :materials, through: :item_materials
        has_many :item_categories
        has_many :categories, through: :item_categories


        validates :slug,:name, uniqueness: true

        after_create :update_slug
        before_update :assign_slug


        def update_slug
            update_attributes slug: assign_slug
        end

        def create_slug
            return self.name.parameterize
         end

    private
        

        def assign_slug
            self.slug = create_slug
        end
end