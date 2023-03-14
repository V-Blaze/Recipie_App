class Recipe < ApplicationRecord
    belongs_to :user

    validates :name, presence: true, length: { maximum: 250 }
    validates :description, presence: true, length: { maximum: 5000 }
    validates :public, presence: true
    validates :preparation_time, presence: true, numericality: { greater_than_or_equal_to: 0, message: "must be a positive number" }
    validates :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0, message: "must be a positive number" }


    def self.created_by_current_user(current_user)
        where(user_id: current_user.id).order(created_at: :desc)
    end
    
    def self.public_recipes_ordered_by_newest
        where(public: true).order(created_at: :desc)
    end
end
