module Users
  class SessionsController < Devise::SessionsController
    def new
      self.resource = resource_class.new(sign_in_params)
      clean_up_passwords(resource)
      yield resource if block_given?
      respond_to do |format|
        format.js
      end
    end

    def create
      if warden.authenticate?(auth_options)
        self.resource = warden.authenticate!(auth_options)
        flash[:success] = 'Signed in successfully.'
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
      else
        respond_to do |format|
          format.js
        end
      end
    end
  end
end
