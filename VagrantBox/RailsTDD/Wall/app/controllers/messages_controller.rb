class MessagesController < ApplicationController
  def index
    @user = User.find(id=session[:user_id])
    @messages = Message.all
  end

  def create
    @user = User.find(id=session[:user_id])
    message = @user.messages.new(message_params)
    if message.save
      flash[:messages] = ["New Message Created"]
      redirect_to "/messages"
    else
      flash[:messages] = message.errors.full_messages
      redirect_to "/messages"
    end
  end

  def comment
  end
  
  private
  def message_params
    params.require(:message).permit(:message)
  end

end
