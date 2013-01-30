require 'spec_helper'

describe Order do

  let (:valid_order) {Order.new(name: 'Alex', email: 'abc@gmail.com', ordertype: 'veggie')}

  it "requires a valid name and email and type" do
    # Empty name
    o=Order.new(name: '', email: 'abc@gmail.com', ordertype: 'veggie')
    o.save.should be_false

    # Invalid email
    o=Order.new(name: 'Alex', email: 'abc@gmail', ordertype: 'veggie')
    o.save.should be_false

    # Invalid type
    o=Order.new(name: 'Alex', email: 'abc@gmail.com', ordertype: 'abcdefg')
    o.save.should be_false

    valid_order.save.should be_true
  end

  it "should return an empty list for ingredients when none are set" do
    valid_order.ingredients.should eq []
  end

  it "can produce a description of itself" do
    valid_order.get_description.should eq "veggie sandwich"
    order_with_ingredients = Order.new(name: 'Alex', email: 'abc@gmail.com', ordertype: 'meaty', ingredients: ['bacon', 'rubber'])
    order_with_ingredients.get_description.should eq "meaty bacon and rubber sandwich"
  end
end
