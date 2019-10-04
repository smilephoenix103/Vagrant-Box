class DisplaysController < ApplicationController
  def index
    render html: 'What do you want me to say???'
  end

  def hello
    render html: 'Hello CodingDojo!'
  end

  def say
    unless params[:name]
      render html: "Saying Hello!"
    else
      if params[:name] == "michael"
        redirect_to '/say/hello/joe'
      else
        render html: "Saying hello, #{params[:name]}!"
      end
    end
  end

  def times
    session[:count] ||= 0
    session[:count] += 1
    render html: "You have visited this URL #{session[:count]} time(s)"
  end

  def restart
    reset_session
    render html: "Destroyed session"
  end
end
