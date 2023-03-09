class Admin::UsersController < Admin::BaseController
  def index
    unless user_is_admin?
      redirect_to root_path
    end
    @users = User.all
  end

  def new
    unless user_is_admin?
      redirect_to root_path
    end
    @user = User.new
  end

  def create
    unless user_is_admin?
      redirect_to root_path
    end

    @user = User.new(user_params)

    if @user.role.name == "Student"
      @student = Student.new
      @user.student = @student
    end

    if @user.save
      redirect_to edit_admin_user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    unless user_is_admin?
      redirect_to root_path
    end

    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to edit_admin_user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    unless user_is_admin?
      redirect_to root_path
    end

    @user = User.find(params[:id])
    @user.destroy

    redirect_to admin_users_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:role_id, :email, :password, :password_confirmation)
  end
end
