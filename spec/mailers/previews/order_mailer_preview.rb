# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def order_confirmation_email

    @order = Order.create(total_cents: "20000", stripe_charge_id: "ch_3Ke0qkD4UmDe5H7a2lcasx1X", email: "kvirani@gmail.com")
    OrderMailer.order_confirmation_email(@order)
  end
end
