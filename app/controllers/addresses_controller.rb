class AddressesController < ApplicationController
  def create
    @address = Address.new(address_param)
    render :errors unless @address.save
  end

  def update
    @id = params[:address][:id]
    @address = Address.new(address_param)
    if @address.save
      Address.find(@id).update!(user_id: nil)
    else
      render :errors
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.update!(user_id: nil)
  end

  private

  def address_param
    params.require(:address).permit(:postal_code, :prefecture, :city, :address1, :address2, :family_name, :given_name, :email, :user_id)
  end

  def card_param
    params.require(:card).permit(:name, :card_num, :expiration_date, :security_code, :user_id)
  end

end
