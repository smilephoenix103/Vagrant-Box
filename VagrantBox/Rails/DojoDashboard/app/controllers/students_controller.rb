class StudentsController < ApplicationController
  def index
    @dojo = Dojo.find(params[:id])
  end

  def new
    @dojo = Dojo.find(params[:id])
    @dojos = Dojo.all
  end

  def create
    student = Student.create(student_params)
    if student.errors.any?
      flash[:errors] = student.errors.full_messages
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "New Student Added"
      redirect_to "/dojos/#{params[:id]}/students"
    end
  end

  def show    
    @dojo = Dojo.find(params[:id])
    @student = Student.find(params[:sid])
  end

  def edit
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:id])
    @student = Student.find(params[:sid])
  end

  def update
    Student.find(params[:sid]).update(student_params)
    redirect_to "/dojos/#{params[:id]}/students"
  end

  def destroy
    Student.find(params[:sid]).delete
    redirect_to "/dojos/#{params[:id]}/students"
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
  end
end
