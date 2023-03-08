class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def register
    if !user_signed_in?
      render :show, status: :unprocessable_entity
    end
    @course = Course.find(params[:id])
    if current_user.role.name == "Student"
      registration = Registration.new(course: @course, student: current_user.student)
      if registration.save
        redirect_to course_path(@course)
      else
        render :show, status: :unprocessable_entity
      end
    else
      render :show, status: :unprocessable_entity
    end
  end

  def unregister
    if !user_signed_in?
      render :show, status: :unprocessable_entity
    end
    courseId = params[:id]
    @course = Course.find(courseId)
    if !current_user.nil? && current_user.role.name == "Student"
      @student = current_user.student
      registration = Registration.find_by(course_id: courseId, student_id: @student.id)
      unless registration.nil?
        registration.destroy
      end
    end
    redirect_to course_path(@course)
  end
end
