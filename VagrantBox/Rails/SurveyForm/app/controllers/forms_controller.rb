class FormsController < ApplicationController
  def index
    session[:views] ||= 0
  end

  def surveys
    session[:views] += 1
    session[:results] = params[:survey]
    flash[:success] = "Thanks for submitting this form! You have submitted #{session[:views]} times now."
    redirect_to '/results'
  end

  def results
    @results = session[:results]
    render 'results'
  end
end
