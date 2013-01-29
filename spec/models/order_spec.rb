require 'spec_helper'

describe Order do
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

    o=Order.new(name: 'Alex', email: 'abc@gmail.com', ordertype: 'veggie')
    o.save.should be_true
  end
end
