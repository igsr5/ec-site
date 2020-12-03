class CheckoutsController < ApplicationController
  layout "checkouts"

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
end
