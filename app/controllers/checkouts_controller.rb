class CheckoutsController < ApplicationController
  layout "checkouts"
  before_action :is_cart

  def address_form_show
    render "address_form"
  end

  def address_set_session
  end

  def card_form_show
  end

  def card_set_session
  end

  def confirm
  end

  def issue_receipt
  end

  def completion_show
  end

  private

  def is_cart
    order_count=Cart.find(session[:cart_id]).order_details.count
    if order_count==0
      redirect_to carts_path
    end
  end
end
