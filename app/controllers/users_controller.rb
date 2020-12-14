class UsersController < ApplicationController
  def show
    @users=User.all
  end

  def new
    @user=User.new
  end
  def create
    @user=User.create(user_params)
    redirect_to :users if @user.valid?
  end

  def edit
  end
  private

  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
