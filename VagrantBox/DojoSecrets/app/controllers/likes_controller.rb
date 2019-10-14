class LikesController < ApplicationController

    def create
       Like.create(like_params)
       redirect_to "/secrets"
    end

    def destroy
        Like.find(params[:id]).delete
        redirect_to "/secrets"
    end

    def like_params
        params.require(:like).permit(:secret_id).merge(user: current_user)
    end

end
