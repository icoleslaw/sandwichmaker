class Bltmailer < ActionMailer::Base

  def request_sandwich(order)
      @order = order
      mail(from: 'no-reply@adingle.webfactional.com',
           to: Sandwhichmaker::Application.config.sandwich_notify_email,
           subject: '*** SANDWICH REQUESTED ***')
  end
end
