class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:logout]
  
  def students
  end
  
  def slogin
    student = Student.find_by_email(params[:email])
    if student && student.authenticate(params[:password])
      session[:user_id] = student.id
      session[:admin] = false
      redirect_to '/students'
    else
      flash[:messages] = ["Invalid Email/Password Combination"]
      redirect_back(fallback_location: root_path)
    end
  end

  def instructors
  end

  def ilogin
    instructor = Instructor.find_by_email(params[:email])
    if instructor && instructor.authenticate(params[:password])
      session[:user_id] = instructor.id
      session[:admin] = true
      redirect_to '/instructors'
    else
      flash[:messages] = ["Invalid Email/Password Combination"]
      redirect_back(fallback_location: root_path)
    end
  end

  def logout
    reset_session
    redirect_to '/'
  end

end
