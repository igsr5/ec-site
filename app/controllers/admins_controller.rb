class AdminsController < ApplicationController
  def new
  end

  def create
    user=User.find_by(email: admin_params[:email])
    if user&.authenticate(admin_params[:password])
      session[:current_user]=user.id
      redirect_to :root
    else
      render :new  
    end
  end

  def destroy
  end
  
  private

  def admin_params 
    params.require(:admin).permit(:email, :password)
  end

end
