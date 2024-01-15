class Lease < ApplicationRecord
    belongs_to :lessee
    belongs_to :lessor
    belongs_to :item
end
