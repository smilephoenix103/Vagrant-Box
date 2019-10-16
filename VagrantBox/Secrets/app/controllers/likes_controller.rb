class LikesController < ApplicationController

    def create
        Like.create(secret: Secret.find(params[:id]), user: current_user)
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @like = Like.find(params[:id])
        if @like.user == current_user
            @like.destroy
            redirect_back(fallback_location: root_path)
        else
            flash[:message] = ["Cannot delete other users' likes"]
            redirect_to "/users/#{current_user.id}"
        end
    end

end
