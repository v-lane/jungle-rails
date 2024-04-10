class OrderMailerPreview < ActionMailer::Preview
  def order_confirmation_email
    OrderMailer.with(order: Order.first).order_confirmation_email
  end
end