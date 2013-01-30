require 'spec_helper'

describe MainController do

  it "should save an order and send an email in response to a post" do
    Order.all.size.should be 0
    ActionMailer::Base.deliveries.size.should be 0

    post :postorder, order: {name: 'Alex', email: 'alex@gmail.com', ordertype: 'vegan'}
    Order.all.size.should be 1

    ActionMailer::Base.deliveries.size.should be 1
    response.should render_template('thanks')
  end

  it "should redisplay order form in response to an invalid post" do
    post :postorder, order: {}
    response.should render_template('home')
  end

end
