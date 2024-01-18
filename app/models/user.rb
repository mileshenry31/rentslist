class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :locations
  has_many :leases
  has_many :lessees
  has_many :lessors
  has_many :cards
  #pay_customer default_payment_processor: :braintree
    def sorted_locations
      sorted_boys = []
      if self.locations.size > 0
        if self.default_location_id
          sorted_boys.push Location.find(self.default_location_id)
        end
        self.locations.each do |location|
          if !sorted_boys.include? location
            sorted_boys.push location
          end
        end
      end
      return sorted_boys
    end
    def sorted_addresses
      sorted_boys = []
      if self.locations.size > 0
        sorted_locations.each do |location|
          sorted_boys.push location.address
        end
      end
      return sorted_boys
    end
  #def set_default_location(:location)
    # does user already have a default location
    # if so uncheck it
    # then check whatever location obect is passed here
  #end
end
