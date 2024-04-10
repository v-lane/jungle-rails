# Preview all emails at http://localhost:3000/rails/mailers/order
class OrderPreview < ActionMailer::Preview
  def order_confirmation_email
    OrderMailer.with(order: Order.first).order_confirmation_email
  end
end
