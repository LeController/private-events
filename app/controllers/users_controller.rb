class UsersController < ApplicationController  
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @events = Event.where(creator_id: params[:id])
  end
end
