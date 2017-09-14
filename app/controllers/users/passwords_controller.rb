class Users::PasswordsController < Devise::PasswordsController

  def after_resetting_password_path_for(resource)
    Devise.sign_in_after_reset_password ? root_path : root_path
  end

  def after_sending_reset_password_instructions_path_for(resource_name)
    root_path if is_navigational_format?
  end
end
