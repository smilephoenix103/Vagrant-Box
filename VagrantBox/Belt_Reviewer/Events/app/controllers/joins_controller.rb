class JoinsController < ApplicationController

    def create
        Join.create(event: Event.find(params[:id]), user: current_user)
        redirect_to "/events/#{params[:id]}"
    end
    
    def destroy
        Join.where(event: Event.find(params[:id]), user: current_user).first.destroy
        redirect_to "/events"
    end

end
