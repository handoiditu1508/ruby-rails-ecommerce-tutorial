class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
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
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to edit_admin_user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to admin_users_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:role_id)
  end
end
