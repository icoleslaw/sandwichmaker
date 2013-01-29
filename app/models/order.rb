class Order < ActiveRecord::Base
  attr_accessible :email, :ingredients, :name, :type
end
