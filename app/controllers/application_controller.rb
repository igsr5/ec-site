class ApplicationController < ActionController::Base
    before_action :set_cart_id_session

    private

    def set_cart_id_session
        unless session[:cart_id]
            cart=Cart.new
            if cart.save
                session[:cart_id] =cart.id
            end
        end
    end
end
