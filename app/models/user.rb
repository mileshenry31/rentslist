class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :locations
  def sorted_locations
    sorted_boys = []
    sorted_boys.push Location.find(self.default_location_id)
    self.locations.each do |location|
      if !sorted_boys.include? location
        sorted_boys.push location
      end
    end
    return sorted_boys
  end
  def sorted_addresses
    sorted_boys = []
    sorted_locations.each do |location|
      sorted_boys.push location.address
    end
    return sorted_boys
  end
  #def set_default_location(:location)
    # does user already have a default location
    # if so uncheck it
    # then check whatever location obect is passed here
  #end
end
