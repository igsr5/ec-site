class AdminsController < ApplicationController
  def new
    @user=User.new
  end

  def create
    redirect_to :root
  end

  def destroy
  end
  
  private

  def session_params 
    params.require(:session).permit(:email, :password)
  end

end
