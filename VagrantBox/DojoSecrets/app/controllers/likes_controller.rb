class LikesController < ApplicationController

    def create
       Like.create(like_params)
       redirect_to "/secrets"
    end

    def destroy
        like = Like.find(params[:id])
        if like.user == current_user
            Like.find(params[:id]).destroy
            redirect_to "/secrets"
        else
            redirect_to "/users/#{current_user.id}"
        end
    end

    def like_params
        params.require(:like).permit(:secret_id).merge(user: current_user)
    end

end
