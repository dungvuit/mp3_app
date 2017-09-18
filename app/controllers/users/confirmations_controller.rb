class Users::ConfirmationsController < Devise::ConfirmationsController

  protected

  def after_confirmation_path_for(resource_name, resource)
    if signed_in?(resource_name)
      root_path
    else
      root_path
    end
  end
end
