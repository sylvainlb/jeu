class HomeController < ApplicationController
  # GET /
  def index
    unless cookies[:user_id].nil?
      user_id=cookies[:user_id]
      @region=Region.where(:user_id => user_id).first
      cookies[:region_id]=@region.id
    else
      @user=User.create()
      cookies[:user_id]=@user.id
      @region=Region.create(name:"Region de #{@user.id}",user_id:@user.id)
      cookies[:region_id]=@region.id
    end
  end
end