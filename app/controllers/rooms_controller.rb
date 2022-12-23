class RoomsController < ApplicationController
  # before_action :authenticate_user! 


  def index
    @room = Room.new
    @rooms = Room.public_rooms

    @users = User.all_except(current_user)
    render 'index'
  end

  def show
    # @single_room = Room.find(params[:id])

    @room = Room.new
    @rooms = Room.public_rooms

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    @users = User.all_except(current_user)
    render 'index'
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

  def confirm_participant
    return unless @room.is_private

    is_participant = Participant.where(user_id: user.id, room_id: room.id).first
    throw :error unless is_participant
  end

end