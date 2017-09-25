module Users
  class PasswordsController < Devise::PasswordsController
    def after_resetting_password_path_for(_resource)
      root_path if Devise.sign_in_after_reset_password
    end

    def after_sending_reset_password_instructions_path_for(_resource_name)
      root_path if is_navigational_format?
    end
  end
end
