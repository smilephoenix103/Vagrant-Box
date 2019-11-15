class InstructorsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def index
    @instructors = Instructor.all
  end

  def create
    instructor = Instructor.create(instructor_params)
    if instructor.errors.any?
      flash[:messages] = instructor.errors.full_messages
      redirect_back(fallback_location: root_path)
    else
      flash[:messages] = ["New instructor added"]
      session[:user_id] = instructor.id
      session[:admin] = true
      redirect_to '/instructors'
    end
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    Instructor.find(params[:id]).update(instructor_params)
    redirect_to '/instructors'
  end

  def destroy
    instructor = Instructor.find(params[:id])
    if instructor == current_user
      instructor.destroy
      flash[:messages] = ["Instructor deleted"]
      redirect_to '/instructors'
    else
      flash[:messages] = ["Cannot delete another instructor"]  
      redirect_to '/instructors'
    end
  end

  
  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name, :email, :admin, :password, :password_confirmation)
  end
end
