class OrderMailer < ApplicationMailer
  default from: 'reply@jungle.com'

  def order_confirmation_email
    @order = params[:order]
    mail(to: @order.email, subject: "Order confirmation: #{@order.id}")
  end
end
