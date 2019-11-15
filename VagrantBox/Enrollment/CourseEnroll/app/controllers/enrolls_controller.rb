class EnrollsController < ApplicationController

    def create
        if Enrollment.exists?(course: Course.find(params[:cid]), student: Student.find(params[:sid]))
            flash[:messages] = ["Already enrolled in class"]
            redirect_back(fallback_location: root_path)
        else
            Enrollment.create(course: Course.find(params[:cid]), student: Student.find(params[:sid]))
            flash[:messages] = ["Enrolled in class"]
            redirect_to "/courses/#{params[:cid]}"
        end
    end

end
