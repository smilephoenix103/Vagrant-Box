class CommentsController < ApplicationController

    def create
        comment = Comment.create(comment_params)
        if comment.errors.any?
            flash[:messages] = comment.errors.full_messages
            redirect_back(fallback_location: root_path)
        else
            flash[:messages] = ["New Comment Added"]
            redirect_back(fallback_location: root_path)
        end
    end

    def comment_params
        params.require(:comment).permit(:comment).merge(user: current_user, event: Event.find(params[:id]))
    end
end
