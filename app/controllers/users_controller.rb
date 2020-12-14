class UsersController < ApplicationController
  def show
    @users=User.all
  end

  def new
    @user=User.new
  end
  def create
    @user=User.new(user_params)

    if @user.save
      redirect_to :users if @user.valid?
    else
      render :new
    end
  end

  def edit
  end
  private

  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
