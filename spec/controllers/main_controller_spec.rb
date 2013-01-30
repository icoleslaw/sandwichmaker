require 'spec_helper'

describe MainController do

  it "should save an order and send an email in response to a post" do
    Order.all.size.should be 0
    emails_sent_before=ActionMailer::Base.deliveries.size

    post :postorder, order: {name: 'Alex', email: 'alex@gmail.com', ordertype: 'vegan'}
    Order.all.size.should be 1

    ActionMailer::Base.deliveries.size.should be emails_sent_before+2
    response.should render_template('thanks')
  end

  it "should save ingredients" do
    Order.all.size.should be 0
    # TODO: use let
    ingredients = {"veggie-0"=>"ostrich egg", "veggie-2"=>"fungus"}
    post :postorder, order: {name: 'Alex', email: 'alex@gmail.com', ordertype: 'veggie', ingredients: ingredients}
    Order.all.size.should be 1
    saved=Order.all[0]
    saved.ingredients.should eq ['ostrich egg', 'fungus']
  end

  it "should redisplay order form in response to an invalid post" do
    post :postorder, order: {}
    response.should render_template('home')
  end

end
