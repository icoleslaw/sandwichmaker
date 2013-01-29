class MainController < ApplicationController

def home
  @order=Order.new
end

def postorder
  @order=Order.new(params[:order])
  if @order.save
    render :thanks
  else
    render :home
  end
end

end
