class EventsController < ApplicationController
  before_action :require_host, except: [:index, :create, :show]

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
    if Event.exists?(params[:id])
      @event = Event.find(params[:id])
      @users = User.all
    else
      flash[:messages] = ["No Event with ID #{params[:id]}"]
      redirect_to "/events"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      flash[:messages] = ["Event Updated"]
      redirect_to "/events"
    else
      flash[:messages] = event.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def event_params
    params.require(:event).permit(:name, :date, :city, :state).merge(user: current_user)
  end

  def require_host
    if Event.exists?(params[:id])
      event = Event.find(params[:id])
      unless event.user == current_user
        flash[:messages] = ["Must be Event Host to Edit/Delete"]
        redirect_to "/events"
      end
    else
      flash[:messages] = ["No Event with ID #{params[:id]}"]
      redirect_to "/events"
    end
  end
end
