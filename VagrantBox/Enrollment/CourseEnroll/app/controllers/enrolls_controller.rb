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

    def destroy
        if Student.find(params[:sid]) == current_user
            enrollment = Enrollment.find_by(course: Course.find(params[:cid]), student: Student.find(params[:sid]))
            enrollment.destroy
            flash[:messages] = ["Unenrolled from class"]
            redirect_to "/courses"
        else
            flash[:messages] = ["Cannot unenroll other students"]
            redirect_to "/courses"
        end
    end

end
