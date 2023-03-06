class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    userId = 2 # todo: get user id from jwt
    @user = User.find_by(id: userId)
    unless @user.nil?
      @student = @user.student
    end
    @course = Course.find(params[:id])
  end

  def register
    @course = Course.find(params[:id])
    userId = 2 # todo: get user id from jwt
    @user = User.find(userId)
    if @user.role.name == "Student"
      registration = Registration.new(course: @course, student: @user.student)
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
    courseId = params[:id]
    @course = Course.find(courseId)
    userId = 2 # todo: get user id from jwt
    @user = User.find_by(id: userId)
    if !@user.nil? && @user.role.name == "Student"
      @student = @user.student
      registration = Registration.find_by(course_id: courseId, student_id: @student.id)
      unless registration.nil?
        registration.destroy
      end
    end
    redirect_to course_path(@course)
  end
end
