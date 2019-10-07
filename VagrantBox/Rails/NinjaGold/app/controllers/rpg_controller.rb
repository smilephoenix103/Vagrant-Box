class RpgController < ApplicationController
  def index
    session[:activities] ||= []
    session[:gold] ||= 0
    @activities = session[:activities]
    @gold = session[:gold]
  end

  def farm
    rand_num = rand(10..20)
    session[:gold] += rand_num
    session[:activities].push("You found #{rand_num} gold in the farm! (" + DateTime.current.getlocal("-05:00").strftime('%I:%M %b %d, %Y') + ")")
    redirect_to '/'
  end

  def cave
    rand_num = rand(5..10)
    session[:gold] += rand_num
    session[:activities].push("You found #{rand_num} gold in the cave! (" + DateTime.current.getlocal("-05:00").strftime('%I:%M %b %d, %Y') + ")")
    redirect_to '/'
  end

  def house
    rand_num = rand(2..5)
    session[:gold] += rand_num
    session[:activities].push("You found #{rand_num} gold in the house! (" + DateTime.current.getlocal("-05:00").strftime('%I:%M %b %d, %Y') + ")")
    redirect_to '/'
  end

  def casino
    rand_num = rand(-50..50)
    session[:gold] += rand_num
    if rand_num < 0
      session[:activities].push("You lost #{rand_num.abs} gold in the casino! (" + DateTime.current.getlocal("-05:00").strftime('%I:%M %b %d, %Y') + ")")
      redirect_to '/'
    else
      session[:activities].push("You won #{rand_num} gold in the casino! (" + DateTime.current.getlocal("-05:00").strftime('%I:%M %b %d, %Y') + ")")
      redirect_to '/'
    end
  end

  def reset
    reset_session
    redirect_to'/'
  end

end
