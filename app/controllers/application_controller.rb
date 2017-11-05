class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorize_user!

  private
    def authorize_user!
      authenticate_user!    
    end
end
