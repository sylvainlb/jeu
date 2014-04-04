class UsersController < ApplicationController
  def index
    @users = User.all

  end

  def show
    @user=User.find(params[:id])

    unless @user.nil?
      cookies[:user_id]=@user.id
    end

    redirect_to root_url
  end
end