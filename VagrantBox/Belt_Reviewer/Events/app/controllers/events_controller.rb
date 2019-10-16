class EventsController < ApplicationController
  def index
    @user = current_user
    @instate = Event.where(state: @user.state)
    @outstate = Event.where.not(state: @user.state)
  end

  def create
    event = Event.create(event_params)
    if event.errors.any?
      flash[:messages] = event.errors.full_messages
      redirect_back(fallback_location: root_path)
    else
      flash[:messages] = ["New Event Added"]
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @event = Event.find(params[:id])
    @users = User.all
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  def event_params
    params.require(:event).permit(:name, :date, :city, :state).merge(user: current_user)
  end
end
