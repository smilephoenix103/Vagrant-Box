class StudentsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def index
    @students = Student.all
  end

  def create
    student = Student.create(student_params)
    if student.errors.any?
      flash[:messages] = student.errors.full_messages
      redirect_back(fallback_location: root_path)
    else
      flash[:messages] = ["New student added"]
      session[:user_id] = student.id
      session[:admin] = false
      redirect_to '/students'
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    Student.find(params[:id]).update(student_params)
    redirect_to '/students'
  end

  def destroy
    student = Student.find(params[:id])
    if student == current_user
      student.destroy
      flash[:messages] = ["Student deleted"]
      redirect_to '/'
    else
      flash[:messages] = ["Cannot delete another student"]  
      redirect_to '/students'
    end
  end

  
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :admin, :password, :password_confirmation)
  end
end
