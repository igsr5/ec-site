class AdminsController < ApplicationController
  def new
    @user=User.new
  end

  def create
    redirect_to :root
  end

  def destroy
  end
end
