class Users::RegistrationsController < Devise::RegistrationsController

  private
  def sign_up_params
    params.require(:user).permit :image, :name, :email, :password,
      :password_confirmation, :address, :phonenumber
  end

  def account_update_params
    params.require(:user).permit :image, :name, :email, :phonenumber, :address, :password,
      :password_confirmation, :current_password
  end

end
