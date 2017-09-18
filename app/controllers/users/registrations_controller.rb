class Users::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      flash[:success] = "Please check your email for active account.!"
      redirect_to root_path
    else
      respond_to do |format|
        format.js
      end
    end
  end

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
