class TimesController < ApplicationController
  def index
    @date = DateTime.current.getlocal("-05:00").strftime('%b %d, %Y')
    @time = DateTime.current.getlocal("-05:00").strftime('%I:%M:%S')
    render 'index'
  end
end
