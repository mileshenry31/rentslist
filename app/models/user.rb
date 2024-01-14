class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :locations

  #def set_default_location(:location)
    # does user already have a default location
    # if so uncheck it
    # then check whatever location obect is passed here
  #end
end
