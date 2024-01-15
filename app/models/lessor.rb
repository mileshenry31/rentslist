class Lessor < ApplicationRecord
    belongs_to :user
    belongs_to :lease
end
