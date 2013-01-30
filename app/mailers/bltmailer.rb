class Bltmailer < ActionMailer::Base

  def request_sandwich(order)
      @order = order
      mail(from: Sandwhichmaker::Application.config.sandwich_from_email,
           to: Sandwhichmaker::Application.config.sandwich_email_to_notify,
           subject: '*** SANDWICH REQUESTED ***')
  end

  def confirm_sandwich(order)
      @notify_email = Sandwhichmaker::Application.config.sandwich_from_email
      @order = order
      mail(from: @notify_email,
           to: @order.email,
           subject: '*** SANDWICH REQUESTED ***')
  end
end
