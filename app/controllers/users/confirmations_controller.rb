module Users
  class ConfirmationsController < Devise::ConfirmationsController
    protected

    def after_confirmation_path_for(resource_name, _resource)
      root_path if signed_in?(resource_name)
    end
  end
end
