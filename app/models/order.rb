class Order < ActiveRecord::Base
  attr_accessible :email, :ingredients, :name, :ordertype

  validates :name, presence: {message: "is required"}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: {message: "is required"}, format: { with: VALID_EMAIL_REGEX }

  validates :ordertype, presence: {message: "must be chosen"}, inclusion: { in: %w(meaty veggie vegan) }
end
