# Controller parent class
#
# Contains the current_user definition
#
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Ensure we have a logged in user in all controllers
  check_authorization unless: :devise_controller?

  # Set up params for devise controllers
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Errors and redirects for unauthorized access
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message

    respond_to do |format|
      format.html do
        # Devise takes this and makes it the first page to load after the person logs in
        session[:user_return_to] = request.url if !signed_in? && request.get?
        redirect_to root_url
      end
      format.json do
        render json: flash, status: :unauthorized
        flash.delete( :error )
      end
      format.js do
        render 'shared/error'
        flash.delete( :error )
      end
    end
  end

  protected

  def configure_permitted_parameters
    # Set parameters for devise sign_up method
    devise_parameter_sanitizer.for( :sign_up ) << :username
    devise_parameter_sanitizer.for( :sign_up ) << :password_confirmation
    # Set parameters for devise sign_in method
    devise_parameter_sanitizer.for( :sign_in ) << :username
    devise_parameter_sanitizer.for( :sign_in ) << :password_confirmation
    # Set parameters for devise account update method
    devise_parameter_sanitizer.for( :account_update ) << :username
    devise_parameter_sanitizer.for( :account_update ) << :password_confirmation
  end

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end
end
