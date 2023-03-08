class Admin::CoursesController < Admin::BaseController
  def index
    unless user_is_admin?
      redirect_to root_path
    end
    @courses = Course.all
  end

  def new
    unless user_is_admin?
      redirect_to root_path
    end
    @course = Course.new
  end

  def create
    unless user_is_admin?
      redirect_to root_path
    end

    @course = Course.new(@course_params)

    if @course.save
      redirect_to edit_admin_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    unless user_is_admin?
      redirect_to root_path
    end
    @course = Course.find(params[:id])
  end

  def update
    unless user_is_admin?
      redirect_to root_path
    end

    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to edit_admin_course_path(@course)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    unless user_is_admin?
      redirect_to root_path
    end
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to admin_courses_path, status: :see_other
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
