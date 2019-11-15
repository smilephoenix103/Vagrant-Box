class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
  end

  def create
    course = Course.create(course_params)
    if course.errors.any?
      flash[:messages] = course.errors.full_messages
      redirect_back(fallback_location: root_path)
    else
      flash[:messages] = ["New course added"]
      redirect_to '/courses'
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    Course.find(params[:id]).update(course_params)
    redirect_to '/courses'
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:messages] = ["Course deleted"]
    redirect_to '/courses'
  end

  def course_params
    params.require(:course).permit(:code, :name, :subject).merge(instructor: Instructor.find(session[:user_id]))
  end 
end
