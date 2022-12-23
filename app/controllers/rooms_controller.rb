class RoomsController < ApplicationController
  # before_action :authenticate_user!   
  before_action :set_users

  def index         
  end

  def show            
  end

  def create
    @room = Room.new(room_params) 
    if @room.save
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :is_private)
  end


  def set_users
    @users = User.all_except(current_user)
  end

end