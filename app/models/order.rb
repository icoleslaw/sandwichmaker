class Order < ActiveRecord::Base
  attr_accessible :email, :ingredients, :name, :ordertype

  validates :name, presence: {message: "is required"}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: {message: "is required"}, format: { with: VALID_EMAIL_REGEX }

  validates :ordertype, presence: {message: "must be chosen"}, inclusion: { in: %w(meaty veggie vegan) }

  serialize :ingredients

  # Converts the ingredients from a parameter hash to an array prior to saving.
  # I suspect it may be possible to set up the rails form in a better way so we
  # don't need to do this.
  def ingredients=(o)
    if (o.instance_of?(HashWithIndifferentAccess))
      super o.values
    else
      super o
    end
  end

  def ingredients
    read_attribute(:ingredients)||[]
  end

  def get_description
    result = "#{ordertype} "
    if ingredients.size > 0
      result << "#{ingredients.to_sentence} "
    end
    result << "sandwich"
  end
end
