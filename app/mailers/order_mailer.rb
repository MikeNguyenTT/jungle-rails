class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation_email(order)
    @order = order
    mail(to: @order.email, subject: 'Order Confirmation Id:' + @order.id.to_s)
  end
  
end
