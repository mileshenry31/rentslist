class Item < ApplicationRecord
    belongs_to :user
    belongs_to :location
    has_one :lease
    def validate 
        errors.add(:price, "should be at least 0.01") if price.nil? || price < 0.01 
    end 
end
