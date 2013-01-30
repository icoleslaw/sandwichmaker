class MainController < ApplicationController

def home
  @order=Order.new
end

def postorder
  @order=Order.new(params[:order])
  if @order.save
    Bltmailer.request_sandwich(@order).deliver
    Bltmailer.confirm_sandwich(@order).deliver
    render :thanks
  else
    render :home
  end
end

end
