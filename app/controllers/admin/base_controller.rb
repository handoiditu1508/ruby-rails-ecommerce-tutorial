class Admin::BaseController < ApplicationController
  def user_is_admin?
    user_signed_in? && current_user.role.name == "Admin"
  end
end
